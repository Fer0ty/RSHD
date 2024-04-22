DO $$
    DECLARE
        start_date DATE := '2024-01-01';
        end_date DATE := '2024-12-31';
        curr_date DATE := start_date;
        table_number INT;
    BEGIN
        WHILE curr_date <= end_date LOOP
            -- Генерация номера стола
            table_number := floor(random() * 100) + 1;
            INSERT INTO orders (order_date, table_id)
            VALUES (curr_date, table_number);
           -- Переход к следующему дню
            curr_date := curr_date + interval '1 day';
        END LOOP;
    END
$$;
