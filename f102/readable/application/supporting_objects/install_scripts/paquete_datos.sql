begin
    --SGT_ZONAS: 7/10000 rows exported, APEX$DATA$PKG/SGT_ZONAS$939601
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_ZONAS', p_delete_after_install => true );
    --SGT_CIUDAD: 79/10000 rows exported, APEX$DATA$PKG/SGT_CIUDAD$346180
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_CIUDAD', p_delete_after_install => true );
    --SGT_DEPTO: 18/10000 rows exported, APEX$DATA$PKG/SGT_DEPTO$719624
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_DEPTO', p_delete_after_install => true );
    --SGT_TIPO_CABLE: 7/10000 rows exported, APEX$DATA$PKG/SGT_TIPO_CABLE$427495
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_TIPO_CABLE', p_delete_after_install => true );
    --SGT_TIPO_EQUIPOS: 56/10000 rows exported, APEX$DATA$PKG/SGT_TIPO_EQUIPOS$285935
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_TIPO_EQUIPOS', p_delete_after_install => true );
    --SGT_TIPO_INTERFAZ: 22/10000 rows exported, APEX$DATA$PKG/SGT_TIPO_INTERFAZ$534143
    apex_data_install.load_supporting_object_data(p_table_name => 'SGT_TIPO_INTERFAZ', p_delete_after_install => true );
end;