select
    categorie,
    date_trunc('month', date_emprunt) as mois,
    count(*) as nb_emprunts,
    count(*) filter (where statut = 'rendu_en_retard') as nb_retards,
    round(
        count(*) filter (where statut = 'rendu_en_retard') * 100.0 / count(*),
        1
    ) as taux_retard_pct,
    round(avg(note_lecteur), 2) as note_moyenne
from {{ ref('stg_emprunts') }}
group by 1, 2
order by mois, categorie