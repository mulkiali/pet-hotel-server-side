import psycopg2

##connect to the db
con = psycopg2.connect(
    host = 'localmachinename here',
    database="databasenamehere",
    user = 'postgres',
    password="postgres",
    port = 5432
)

##curser = commands used to communicate with DB
cur = con.cursor()
##execute query
cur.execute("select id, name from "database name")

rows = cur.fetchall()

for r in rows:
    print (f"id {r[0]} name {r[1]}")
    
##close cursor
    cur.close()
##close the connection
con.close()


