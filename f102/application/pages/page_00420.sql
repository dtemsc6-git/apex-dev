prompt --application/pages/page_00420
begin
--   Manifest
--     PAGE: 00420
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_page.create_page(
 p_id=>420
,p_name=>'TEST_MAP_WAN'
,p_alias=>'TEST-MAP-WAN'
,p_step_title=>'TEST_MAP_WAN'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(521217083364905)
,p_plug_name=>'FILTRO_MAPA'
,p_title=>'Filtrar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(91234824068233944300)
,p_required_patch=>wwv_flow_imp.id(197180071872965446203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(91234824068233944300)
,p_plug_name=>'TEST_MAP_WAN'
,p_title=>'Mapas WAN'
,p_region_name=>'TEST_MAP_WAN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'V_SITIOS_GPS'
,p_include_rowid_column=>false
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_MAP_REGION'
);
wwv_flow_imp_page.create_map_region(
 p_id=>wwv_flow_imp.id(91234824400933944301)
,p_region_id=>wwv_flow_imp.id(91234824068233944300)
,p_height=>640
,p_navigation_bar_type=>'FULL'
,p_navigation_bar_position=>'END'
,p_init_position_zoom_type=>'QUERY_RESULTS'
,p_layer_messages_position=>'BELOW'
,p_legend_position=>'END'
,p_features=>'RECTANGLE_ZOOM:SCALE_BAR:INFINITE_MAP:DISTANCE_TOOL'
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(91234824973903944302)
,p_map_region_id=>wwv_flow_imp.id(91234824400933944301)
,p_name=>'Trazado'
,p_layer_type=>'LINE'
,p_display_sequence=>10
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_layer_source=>'select ''TRAZADO'' TRAZADO, CREAR_RUTA_WAN(:P420_WAN) FROM DUAL;'
,p_items_to_submit=>'P420_WAN'
,p_has_spatial_index=>false
,p_geometry_column_data_type=>'SDO_GEOMETRY'
,p_geometry_column=>'CREAR_RUTA_WAN(:P420_WAN)'
,p_stroke_style=>'SOLID'
,p_tooltip_adv_formatting=>false
,p_info_window_adv_formatting=>false
,p_allow_hide=>true
);
wwv_flow_imp_page.create_map_region_layer(
 p_id=>wwv_flow_imp.id(88034740070463770443)
,p_map_region_id=>wwv_flow_imp.id(91234824400933944301)
,p_name=>'SITIOS'
,p_label=>'SITIOS'
,p_layer_type=>'POINT'
,p_display_sequence=>20
,p_location=>'REGION_SOURCE'
,p_no_data_found_message=>'No data'
,p_more_data_found_message=>'More data'
,p_has_spatial_index=>false
,p_pk_column=>'ID'
,p_geometry_column_data_type=>'LONLAT_COLUMNS'
,p_longitude_column=>'LON'
,p_latitude_column=>'LAT'
,p_point_display_type=>'SVG'
,p_point_svg_shape=>'Default'
,p_feature_clustering=>false
,p_tooltip_adv_formatting=>false
,p_tooltip_column=>'SIGLAS'
,p_info_window_adv_formatting=>false
,p_info_window_title_column=>'SIGLAS'
,p_allow_hide=>true
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521319335364906)
,p_name=>'P420_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(521217083364905)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(522544787364919)
,p_name=>'P420_ZONA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(521217083364905)
,p_prompt=>'ZONA'
,p_source=>'ZONA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'hide_radio_buttons', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(522824987364921)
,p_name=>'P420_TIPO_SITIO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(521217083364905)
,p_prompt=>'TIPO_SITIO'
,p_source=>'TIPO_SITIO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(88034739989969770442)
,p_name=>'P420_WAN'
,p_item_sequence=>20
,p_prompt=>'Wan'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'ENLACES_WAN'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88034740385908770446)
,p_name=>'SetearListener'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P420_WAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88034740414340770447)
,p_event_id=>wwv_flow_imp.id(88034740385908770446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'var mapRegion = apex.region("TEST_MAP_WAN"); // Static ID de tu mapa',
'console.log(mapRegion);',
'',
'',
'mapRegion.widget().one("spatialmapchanged", function(){',
unistr('    // Obtener capa con las geometr\00EDas cargadas'),
'    var layerGroup = mapRegion.getLayer("features");',
'    if (layerGroup && layerGroup.getLayers().length > 0) {',
'        // Ajustar la vista a los puntos cargados',
'        mapRegion.getMap().fitBounds(layerGroup.getBounds());',
'    }',
'});',
'*/',
'',
'',
'apex.server.process(',
'    ''GET_ONE_LNG_LAT'', { pageItems: ''#P420_WAN'' },',
'    {',
'        success: function (apiData) {',
'            console.log(apiData.data);',
'            if (apiData.data) {',
'                apex.region("TEST_MAP_WAN").call("getMapObject").flyTo({',
'                    center: [apiData.data[0].LON, apiData.data[0].LAT],',
'                    screenSpeed: 0.8',
'                });',
'            }',
'        }',
'    }',
');',
'',
'/*var region = apex.region("TEST_MAP_WAN");',
'console.log(region);',
'',
'region.widget().one("spatialmapchanged", function () {',
'    var map = region.getMap();',
'    var bounds = null;',
'    console.log("spatialmapchanged");',
'    map.eachLayer(function (layer) {',
'        try {',
unistr('            // \D83D\DFE2 CAPA DE PUNTOS (marcadores)'),
'            if (layer.getLatLng) {',
'                var ll = layer.getLatLng();',
'                if (!bounds) bounds = L.latLngBounds(ll, ll);',
'                else bounds.extend(ll);',
'            }',
'',
unistr('            // \D83D\DD35 CAPA DE RUTAS (l\00EDneas o pol\00EDgonos)'),
'            else if (layer.getLatLngs) {',
'                var addLatLngs = function (arr) {',
'                    arr.forEach(function (item) {',
'                        if (Array.isArray(item)) {',
'                            addLatLngs(item);',
'                        } else {',
'                            if (!bounds) bounds = L.latLngBounds(item, item);',
'                            else bounds.extend(item);',
'                        }',
'                    });',
'                };',
'                addLatLngs(layer.getLatLngs());',
'            }',
'',
unistr('            // \D83D\DFE3 GeoJSON (por si APEX devuelve datos como feature collection)'),
'            else if (layer.feature && layer.feature.geometry) {',
'                var coords = layer.feature.geometry.coordinates;',
'                var addCoords = function (c) {',
'                    if (Array.isArray(c[0])) c.forEach(addCoords);',
'                    else {',
'                        var ll = L.latLng(c[1], c[0]);',
'                        if (!bounds) bounds = L.latLngBounds(ll, ll);',
'                        else bounds.extend(ll);',
'                    }',
'                };',
'                addCoords(coords);',
'            }',
'        } catch (e) {',
'            console.error("Error procesando capa:", e);',
'        }',
'    });',
'',
unistr('    // Ajustar c\00E1mara si hay datos v\00E1lidos'),
'    if (bounds && bounds.isValid()) {',
'        map.fitBounds(bounds, { padding: [20, 20] }); // padding para no pegarse a los bordes',
'    } else {',
unistr('        console.log("\26A0\FE0F No se encontraron coordenadas para centrar el mapa.");'),
'    }',
'});',
'*/'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(88034740127484770444)
,p_name=>'Refrescar'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P420_WAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(88034740247773770445)
,p_event_id=>wwv_flow_imp.id(88034740127484770444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(91234824068233944300)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(88034740753693770450)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_ONE_LNG_LAT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--OBTIENE UNA LNG Y LAT PARA MOVER EL MAPA',
'declare',
'l_cursor SYS_REFCURSOR;',
'BEGIN',
'',
'    open l_cursor for',
'    SELECT LON, LAT FROM V_SITIOS_GPS V',
'    INNER JOIN SGT_SITIOS_ENLACE_WAN SW ON V.ID = SW.SITIO_ID',
'    WHERE SW.ENLACE_WAN_ID = :P420_WAN;',
'',
'    -- DEBO RETORNAR EL PRIMER ELEMENTO NOMAS ',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''data'', l_cursor); -- Convierte el cursor a JSON array',
'    APEX_JSON.CLOSE_OBJECT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>88034740753693770450
);
wwv_flow_imp.component_end;
end;
/
