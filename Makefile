all: migrate server

migrate:
	bundle install
	rake db:migrate

server:
	rails server
