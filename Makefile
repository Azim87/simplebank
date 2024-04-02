postgres: 
		docker run -d --name postgresCont -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=123456 postgres:16

createdb: 
		docker exec -it postgresCont createdb --username=root --owner=root simple_bank

dropdb: 
		docker exec -it postgresCont dropdb simple_bank

migrateup:
		migrate -path db/migration -database "postgresql://root:123456@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateup1:
		migrate -path db/migration -database "postgresql://root:123456@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
		migrate -path db/migration -database "postgresql://root:123456@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
		sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc