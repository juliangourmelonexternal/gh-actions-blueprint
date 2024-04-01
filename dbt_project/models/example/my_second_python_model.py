from snowflake.snowpark.functions import udf

def model(dbt, session):
    # Must be either table or incremental (view is not currently supported)
    dbt.config(materialized = "table")

    # User defined function
    @udf
    def add_one(x: int) -> int:
        x = 0 if not x else x
        return x + 1

    # DataFrame representing an upstream model
    df = dbt.ref("book_loans")

    # Add a new column containing the id incremented by one
    df = df.withColumn("BOOK_ID_PLUS_ONE", add_one(df["BOOK_ID"]))

    return df
