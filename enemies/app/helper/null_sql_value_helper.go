package helper

import (
	"database/sql"
	"encoding/json"
	"reflect"

	_ "github.com/denisenkom/go-mssqldb"
)

type NullFloat64 sql.NullFloat64

type NullInt32 sql.NullInt32

func (ni *NullFloat64) Scan(value interface{}) error {
	var i sql.NullFloat64
	if err := i.Scan(value); err != nil {
		return err
	}

	if reflect.TypeOf(value) == nil {
		*ni = NullFloat64{i.Float64, false}
	} else {
		*ni = NullFloat64{i.Float64, true}
	}
	return nil
}

func (ni *NullFloat64) MarshalJSON() ([]byte, error) {
	if !ni.Valid {
		return []byte("null"), nil
	}
	return json.Marshal(ni.Float64)
}

func (ni *NullFloat64) UnmarshalJSON(b []byte) error {
	err := json.Unmarshal(b, &ni.Float64)
	ni.Valid = (err == nil)
	return err
}

func (ni *NullInt32) Scan(value interface{}) error {
	var i sql.NullInt32
	if err := i.Scan(value); err != nil {
		return err
	}

	if reflect.TypeOf(value) == nil {
		*ni = NullInt32{i.Int32, false}
	} else {
		*ni = NullInt32{i.Int32, true}
	}
	return nil
}

func (ni *NullInt32) MarshalJSON() ([]byte, error) {
	if !ni.Valid {
		return []byte("null"), nil
	}
	return json.Marshal(ni.Int32)
}

func (ni *NullInt32) UnmarshalJSON(b []byte) error {
	err := json.Unmarshal(b, &ni.Int32)
	ni.Valid = (err == nil)
	return err
}
