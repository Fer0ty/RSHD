DO $$
DECLARE
    schema_name          TEXT := 's334645';
    column_count         INT  := 0; -- Счетчик измененных столбцов в конкретной таблице
    renamed_column_count INT  := 0; -- Счетчик измененных стобцов
    renamed_table_count  INT  := 0; -- Счетчик измененных таблиц
    table_record         RECORD;
    column_record        RECORD;
BEGIN
    FOR table_record IN
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema = schema_name
        LOOP
            column_count := 0;
            FOR column_record IN
                SELECT column_name
                FROM information_schema.columns
                WHERE table_schema = table_record.table_schema
                  AND table_name = table_record.table_name
                  AND (column_name LIKE '%"%' OR column_name LIKE '%''%')
                LOOP
                    EXECUTE 'ALTER TABLE ' || quote_ident(table_record.table_schema) || '.' ||
                            quote_ident(table_record.table_name) ||
                            ' RENAME COLUMN ' || quote_ident(column_record.column_name) ||
                            ' TO ' || quote_ident(REPLACE(REPLACE(column_record.column_name, '"', ''), '''', '')) ||
                            ';';
                    column_count := column_count + 1;
                END LOOP;

            IF column_count > 0 THEN
                renamed_table_count := renamed_table_count + 1;
                renamed_column_count := renamed_column_count + column_count;
            END IF;

        END LOOP;
    RAISE NOTICE 'Схема: %', schema_name;
    RAISE NOTICE 'Cтолбцов переименовано: %', renamed_column_count;
    RAISE NOTICE 'Таблиц изменено: %', renamed_table_count;
END
$$ LANGUAGE plpgsql;
