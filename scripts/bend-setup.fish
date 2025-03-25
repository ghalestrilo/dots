set bend_dir $HOME/git/bend

mise install postgresql && mise use -g postgresql@latest
mise install gpg        && mise use -g gpg@latest
mise install gh         && mise use -g gh@latest
mise install awscli     && mise use -g awscli@latest

if ! gh auth status >/dev/null 2>&1
  gh auth login
end

gh repo clone bendhealth/bender-go $bend_dir/bender-go
gh repo clone bendhealth/Bend-API $bend_dir/Bend-API
gh repo clone yaml/libyaml $bend_dir/libyaml

# cd $bend_dir/libyaml
# ./configure
# make
# make install


# asdf plugin add ruby nodejs golang terraform yarn postgres
# for plugin in ruby nodejs golang terraform yarn postgres
#     asdf install $plugin
# end

# Bender-go
cd $bend_dir/bender-go
mise install
go install
mise reshim
bender-go update -i testing 


# AWS
aws sso login

# Run docker in detached mode for Redis and Postgres
echo "=== Configuring Docker Services ==="
cd $bend_dir/Bend-API/applications/bend_health
# Ensure you have the docker client running at this point
docker-compose up -d

echo "=== Installing Dependencies ==="
mise install
bundle install
# Copy env settings
cp .env.development .env.local

echo "=== Initializing Database ==="
# Initialize database and dependences
rails db:create
rails db:schema:load
# Seeds

echo "=== Dumping Testing Server database ==="
kubectl port-forward svc/api-dev-testing-one-postgres-rw 5433:5432 &
# may need to update database.yml to use 5433 instead of 5432.
# Copy RAILS_DB_PWD from testing-one environment
bender-go secrets -e testing-one get | grep RAILS_DB_PWD | pbcopy
# Dump db and utilize copied RAILS_DB_PWD from above
pg_dump -h localhost -p 5433 -U postgres -Fc -b -v -f database-dump.sql -d bend_health_testing

echo "=== Restoring database locally ==="
cat database-dump.sql | docker exec -i bend-api-postgres-1 pg_restore -U postgres -d bend_health_dev --section=pre-data
cat database-dump.sql | docker exec -i bend-api-postgres-1 pg_restore -U postgres -d bend_health_dev --section=data
cat database-dump.sql | docker exec -i bend-api-postgres-1 pg_restore -U postgres -d bend_health_dev --section=post-data

echo "=== Starting Member Portal setup ==="
cd ../member-portal-web

echo "=== Installing Dependencies ==="
mise install
yarn install