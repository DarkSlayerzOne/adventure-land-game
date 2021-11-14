package data

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/denisenkom/go-mssqldb"
	"github.com/joho/godotenv"
)

const (
	Server   string = "DB_SERVER"
	Port     string = "DB_PORT"
	Password string = "DB_PASSWORD"
	Username string = "DB_USERNAME"
	Database string = "DB_INSTANCE"
)

func DbConnection() (*sql.DB, error) {

	err := godotenv.Load("items.env")
	if err != nil {
		log.Fatal("Error loading .env file")
		return nil, err
	}

	username := os.Getenv(Username)
	port := os.Getenv(Port)
	server := os.Getenv(Server)
	password := os.Getenv(Password)
	database := os.Getenv(Database)

	var db *sql.DB
	var errs error

	connectionString := fmt.Sprintf("server=%s;user id=%s;password=%s;database=%s;port=%s",
		server, username, password, database, port)

	db, errs = sql.Open("sqlserver", connectionString)

	if errs != nil {
		log.Fatal("Error creating connection pool: " + err.Error())
		return nil, errs
	}

	log.Printf("Connected!\n")
	var result string

	ctx := context.Background()

	errs = db.QueryRowContext(ctx, "SELECT @@version").Scan(&result)

	if errs != nil {
		log.Fatal("Scan failed:", errs.Error())
		return nil, errs
	}

	return db, errs
}
