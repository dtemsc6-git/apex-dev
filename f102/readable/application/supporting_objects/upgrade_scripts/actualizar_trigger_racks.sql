create or replace trigger "TRG_RACKS_VALIDAR_ALTURA_U"
before
insert or update on "SGT_RACKS"
for each row

declare

v_equipo_bloqueador varchar2(255);
v_count_conflictos number := 0;

begin


 -- Solo validar si se está reduciendo la altura del rack al editar, al crear no hay equipos asociados.
 -- por lo que no hace falta validar eso.
    IF UPDATING then 
    
        if :NEW.altura_u >= :OLD.altura_u THEN
            RETURN; -- No hay reducción, no validar
        END IF;

         -- Verificar si hay equipos que exceden la nueva altura
        SELECT COUNT(*) INTO v_count_conflictos
        FROM sgt_equipos e  
        WHERE e.rack_id = :NEW.id 
          AND (e.u + e.altura_u - 1) > :NEW.altura_u;

    
        IF v_count_conflictos > 0 THEN
            -- Obtener detalles de los equipos conflictivos
            FOR rec IN (
                SELECT e.id, 
                       e.nombre, 
                       (e.u + e.altura_u - 1) as last_u,
                       e.posicion,
                       e.u as u_inicio,
                       e.altura_u
                FROM sgt_equipos e  
                WHERE e.rack_id = :NEW.id 
                  AND (e.u + e.altura_u - 1) > :NEW.altura_u
                ORDER BY e.posicion, e.u
            ) LOOP
                -- Mensaje de debug para cada equipo conflictivo
                apex_debug.message('Equipo conflictivo: ' || rec.nombre || 
                                   ' (ID: ' || rec.id || 
                                   ', Posición: ' || rec.posicion || 
                                   ', Ocupa U: ' || rec.u_inicio || '-' || rec.last_u || 
                                   ', Nueva altura rack: ' || :NEW.altura_u || 'U)');
            END LOOP;
        
            -- Cancelar la operación
            RAISE_APPLICATION_ERROR(-20001, 
                'No se puede reducir la altura del rack a ' || :NEW.altura_u || 
                'U porque existen ' || v_count_conflictos || 
                ' equipo(s) que ocupan U superiores. Revise los logs para más detalles.');
         END IF;

    end if;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Si no hay datos, no hay conflicto
        apex_debug.message('TRG_RACKS_VALIDAR_ALTURA_U: No hay equipos conflictivos');
    WHEN OTHERS THEN
        -- Manejo de errores
        apex_debug.message('TRG_RACKS_VALIDAR_ALTURA_U Error: ' || SQLERRM);
        RAISE; -- Relanzar el error para que no se ignore

        
end "TRG_RACKS_VALIDAR_ALTURA_U";
/