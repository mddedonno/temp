import pyodbc

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 18 for SQL Server};'
    'SERVER=nonacomp-sql.database.windows.net;'
    'UID=sql-source-reader;'
    'PWD=myVerySecurePasswordis:1234!;'
    'Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;'
)
cursor = conn.cursor()
cursor.execute("SELECT TOP 1 * FROM Person.Person")
print(cursor.fetchone())