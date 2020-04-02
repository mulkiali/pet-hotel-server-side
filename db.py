import psycopg2

##connect to the db
con = psycopg2.connect(
    host = 'localhost',
    database="pet_hotel"
   
)

##curser = commands used to communicate with DB
cur = con.cursor()
##execute query
cur.execute("select * from owners")

rows = cur.fetchall()

for r in rows:
    print (f"id {r[0]} name {r[1]}")

##close cursor
    cur.close()
##close the connection
con.close()


