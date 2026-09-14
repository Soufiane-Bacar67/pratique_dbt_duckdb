
## Ce que fait le pipeline

1. **Source** : une table brute `emprunts` (50 000 lignes) contenant des emprunts de bibliothèque, avec des données volontairement imparfaites (dates manquantes, notes non renseignées).
2. **Staging** (`stg_emprunts`) : conversion propre des types (`try_cast`) et nettoyage des valeurs manquantes.
3. **Mart** (`mrt_emprunts_par_categorie`) : agrégation du nombre d'emprunts, du taux de retard et de la note moyenne, par catégorie de livre et par mois.

## Tests

7 tests dbt couvrant l'unicité des identifiants, les valeurs non nulles sur les colonnes critiques, et les valeurs acceptées du statut d'emprunt (`unique`, `not_null`, `accepted_values`).

## Commandes utiles

```bash
dbt run      # exécute les modèles
dbt test     # lance les tests
dbt show --select stg_emprunts   # aperçu d'un modèle
```

## Ce que ce projet m'a permis de pratiquer

- Connexion dbt à DuckDB via `profiles.yml`
- Distinction entre `source()` (donnée externe) et `ref()` (objet créé par dbt)
- Matérialisations (`view` pour le staging, `table` pour les marts)
- Tests génériques dbt
