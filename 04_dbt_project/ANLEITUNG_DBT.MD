# DBT tutorial

## Installation von dbt
Führe folgende Befehle nacheinander im Terminal aus: 
```bash
cd 04_dbt_project/
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
source venv/bin/activate
dbt deps
dbt build
dbt docs generate
dbt docs serve
```

## Deployen der Models nach MotherDuck

```bash
dbt build -t prod
```

Schaue in Motherduck die erstellten Daten an.

## Zufügen der AdventureWorks Tabellen

1. verschiebe den Ordner Bronze von models_inactive nach models
2. verschiebe den Ordner Silver von models_inactive nach models
3. verschiebe den Ordner Gold von models_inactive nach models


## Erweitern des AdventureWorks Beispiels

Erweitere das Beispiel analog dem Code von Databricks Delta Live Tables.