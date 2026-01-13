create unique index "SGT_SALAS_SALA_SIGLA_UNIQ"
on "SGT_SALAS" ( "SITIO_ID",UPPER("SIGLAS") );