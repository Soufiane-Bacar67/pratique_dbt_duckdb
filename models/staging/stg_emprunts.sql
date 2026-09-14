SELECT
    emprunt_id,
    membre_id,
    livre_id,
    titre_livre,
    categorie,
    try_cast(date_emprunt as date) as date_emprunt,
    try_cast(date_retour as date) as date_retour,
    duree_prevue_jours,
    statut,
    ville_membre,
    note_lecteur
from {{ source('raw', 'emprunts') }}