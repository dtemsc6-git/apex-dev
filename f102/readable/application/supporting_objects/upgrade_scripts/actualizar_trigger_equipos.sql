create or replace trigger "TRG_EQUIPOS_VALIDAR_U"
FOR INSERT OR UPDATE ON sgt_equipos
COMPOUND TRIGGER

   TYPE t_reg IS RECORD (
      rack_id   sgt_equipos.rack_id%TYPE,
      u         sgt_equipos.u%TYPE,
      altura_u     sgt_equipos.altura_u%TYPE,
      posicion  sgt_equipos.posicion%TYPE,
      id        sgt_equipos.id%TYPE
   );

   TYPE t_tab IS TABLE OF t_reg;
   g_data t_tab := t_tab();
   

   BEFORE EACH ROW IS
   BEGIN
      g_data.EXTEND;
      g_data(g_data.LAST).rack_id  := :NEW.rack_id;
      g_data(g_data.LAST).u := :NEW.u;
      g_data(g_data.LAST).altura_u    := :NEW.altura_u;
      g_data(g_data.LAST).posicion := :NEW.posicion;
      g_data(g_data.LAST).id       := :NEW.id;
   END BEFORE EACH ROW;

   AFTER STATEMENT IS
      v_count NUMBER;
      v_rack_altura NUMBER;
      v_u_fin number;
      v_equipo_bloqueador varchar2(200);
   BEGIN
      

      --apex_debug_message.log_long_message('TRG_valida_solapamiento new.id: ' || :new.id  ||', new.rack_id: ' || :new.rack_id || ', new.posicion: '|| :new.posicion); 
      
      FOR i IN 1 .. g_data.COUNT LOOP
           
           SELECT altura_u INTO v_rack_altura
  FROM sgt_Racks
  WHERE id = g_data(i).rack_id;
           
                  
  
  -- Validar rango
  if ( g_data(i).u < 1 ) then
    RAISE_APPLICATION_ERROR(-20001,
      'ERROR: La posicion U no puede ser menor a 1 ' || g_data(i).u 
    );
  end if;
  v_u_fin := g_data(i).u + g_data(i).altura_u - 1;
  
  IF v_u_fin > v_rack_altura THEN
    RAISE_APPLICATION_ERROR(-20002,
      'ERROR: El equipo requiere ' || g_data(i).altura_u || 
      'U (U' || g_data(i).u || ' a U' || v_u_fin || 
      ') pero el rack solo tiene ' || v_rack_altura || 'U disponibles.');
  END IF;


         SELECT COUNT(*)
         INTO v_count
         FROM sgt_equipos e
         WHERE e.rack_id = g_data(i).rack_id
           AND e.posicion = g_data(i).posicion
           AND e.id <> g_data(i).id
           AND g_data(i).u <= e.u + e.altura_u - 1
           AND g_data(i).u + g_data(i).altura_u - 1  >= e.u;

         IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(
               -20003,
               'Existe solapamiento de U en el rack'
            );
         END IF;

      END LOOP;
   END AFTER STATEMENT;
END "TRG_EQUIPOS_VALIDAR_U";
/