start:
	docker-compose --env-file .env up -d

build:
	docker-compose --env-file .env up --build  -d

init:
	docker-compose exec sentry sentry upgrade
	docker-compose exec sentry bash -c 'sentry createuser --email $SENTRY_EMAIL_USER --password $SENTRY_EMAIL_PASSWORD --superuser'

stop:
	docker-compose down

db_init:
	docker-compose exec rails rails db:create db:migrate db:seed

console:
	docker-compose exec rails rails console

test:
	docker-compose exec -e "RAILS_ENV=test" rails bundle exec rspec
