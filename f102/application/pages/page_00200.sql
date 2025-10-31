prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_name=>'Dashboard de Cumplimiento'
,p_alias=>'DASHBOARD-DE-CUMPLIMIENTO'
,p_step_title=>'Dashboard de Cumplimiento'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.dashboard-page {',
'    background-color: #f8f9fc;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    min-height: 100vh;',
'}',
'',
'.dashboard-card {',
'    border-radius: 10px;',
'    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);',
'    transition: transform 0.3s ease, box-shadow 0.3s ease;',
'    margin-bottom: 20px;',
'    background: white;',
'}',
'',
'.dashboard-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);',
'}',
'',
unistr('/* Estilos para Cards de m\00E9tricas */'),
'.metric-card {',
'    text-align: center;',
'    padding: 25px;',
'    border-left: 4px solid #3498db;',
'}',
'',
'.metric-card.is-danger {',
'    border-left-color: #e74c3c;',
'    background: linear-gradient(135deg, #fff5f5 0%, #fed7d7 100%);',
'}',
'',
'.metric-card.is-warning {',
'    border-left-color: #f39c12;',
'    background: linear-gradient(135deg, #fffbf0 0%, #feebcb 100%);',
'}',
'',
'.metric-card.is-success {',
'    border-left-color: #27ae60;',
'    background: linear-gradient(135deg, #f0fff4 0%, #c6f6d5 100%);',
'}',
'',
'.metric-card.is-info {',
'    border-left-color: #3498db;',
'    background: linear-gradient(135deg, #ebf8ff 0%, #bee3f8 100%);',
'}',
'',
'.metric-value {',
'    font-size: 2.8rem;',
'    font-weight: 700;',
'    color: #2c3e50;',
'    margin: 15px 0;',
'    text-shadow: 1px 1px 2px rgba(0,0,0,0.1);',
'}',
'',
'.metric-subtitle {',
'    color: #7f8c8d;',
'    font-size: 0.95rem;',
'    font-weight: 500;',
'}',
'',
unistr('/* Estilos para gr\00E1ficos */'),
'.chart-container {',
'    background: white;',
'    border-radius: 10px;',
'    padding: 25px;',
'    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);',
'    margin-bottom: 20px;',
'}',
'',
'.chart-title {',
'    font-size: 1.4rem;',
'    font-weight: 600;',
'    color: #2c3e50;',
'    margin-bottom: 20px;',
'    text-align: center;',
'    border-bottom: 2px solid #ecf0f1;',
'    padding-bottom: 10px;',
'}',
'',
'/* Estilos para tabla */',
'.audit-table {',
'    background: white;',
'    border-radius: 10px;',
'    overflow: hidden;',
'    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);',
'}',
'',
'.table-header {',
'    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);',
'    color: white;',
'    padding: 15px 20px;',
'    font-size: 1.2rem;',
'    font-weight: 600;',
'}',
'',
'/* Filtros */',
'.filter-container {',
'    background: white;',
'    border-radius: 10px;',
'    padding: 20px;',
'    margin-bottom: 20px;',
'    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);',
'    border-left: 4px solid #3498db;',
'}',
'',
'.filter-title {',
'    font-size: 1.1rem;',
'    font-weight: 600;',
'    color: #2c3e50;',
'    margin-bottom: 15px;',
'}',
'',
'/* Botones */',
'.btn-refresh {',
'    background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);',
'    color: white;',
'    border: none;',
'    padding: 12px 24px;',
'    border-radius: 6px;',
'    cursor: pointer;',
'    font-size: 1rem;',
'    font-weight: 500;',
'    transition: all 0.3s ease;',
'    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);',
'}',
'',
'.btn-refresh:hover {',
'    transform: translateY(-2px);',
'    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);',
'}',
'',
'/* Header del dashboard */',
'.dashboard-header {',
'    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);',
'    color: white;',
'    padding: 30px;',
'    border-radius: 10px;',
'    margin-bottom: 30px;',
'    text-align: center;',
'    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);',
'}',
'',
'.dashboard-title {',
'    font-size: 2.2rem;',
'    font-weight: 300;',
'    margin-bottom: 10px;',
'    text-shadow: 1px 1px 2px rgba(0,0,0,0.2);',
'}',
'',
'.dashboard-subtitle {',
'    font-size: 1.1rem;',
'    opacity: 0.9;',
'    font-weight: 400;',
'}',
'',
'/* Responsive Design */',
'@media (max-width: 768px) {',
'    .metric-value {',
'        font-size: 2rem;',
'    }',
'    ',
'    .dashboard-card {',
'        margin-bottom: 15px;',
'        padding: 15px;',
'    }',
'    ',
'    .chart-container {',
'        padding: 15px;',
'    }',
'    ',
'    .dashboard-title {',
'        font-size: 1.8rem;',
'    }',
'}',
'',
'@media (max-width: 480px) {',
'    .metric-value {',
'        font-size: 1.6rem;',
'    }',
'    ',
'    .dashboard-header {',
'        padding: 20px;',
'    }',
'    ',
'    .filter-container {',
'        padding: 15px;',
'    }',
'}',
'',
'/* Animaciones */',
'@keyframes fadeInUp {',
'    from {',
'        opacity: 0;',
'        transform: translateY(20px);',
'    }',
'    to {',
'        opacity: 1;',
'        transform: translateY(0);',
'    }',
'}',
'',
'.dashboard-card {',
'    animation: fadeInUp 0.6s ease-out;',
'}',
'',
unistr('/* Optimizaci\00F3n para gr\00E1ficos compactos */'),
'.chart-container-small {',
'    padding: 15px !important;',
'    margin-bottom: 15px !important;',
'}',
'',
'.chart-container-small .a-Region-body {',
'    padding: 10px !important;',
'}',
'',
unistr('/* Ajustar altura espec\00EDfica para pie chart */'),
'.apex-chart-pie {',
'    max-height: 250px !important;',
'}',
'',
'/* Mejorar spacing entre regiones */',
'.t-Region {',
'    margin-bottom: 15px;',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079793226455440104)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(197180072443235446203)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079793912944440106)
,p_plug_name=>'Cards_riesgos'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''ALTO RIESGO'' as CARD_TITLE,',
'    TO_CHAR(NVL(COUNT(CASE WHEN NIVEL_RIESGO = ''ALTO_RIESGO'' THEN 1 END), 0), ''999,999'') as CARD_VALUE,',
unistr('    ''Cambios cr\00EDticos en tablas principales'' as CARD_SUBTITLE,'),
'    ''fa fa-exclamation-circle'' as CARD_ICON,',
'    ''is-danger'' as CARD_COLOR',
'FROM V_AUDIT_CUMPLIMIENTO ',
'',
'',
'UNION ALL',
'',
'SELECT ',
'    ''VIOLACIONES'' as CARD_TITLE,',
'    TO_CHAR(NVL(COUNT(CASE WHEN ESTADO_CUMPLIMIENTO = ''VIOLACION_POLITICA'' THEN 1 END), 0), ''999,999'') as CARD_VALUE,',
unistr('    ''Requieren atenci\00F3n inmediata'' as CARD_SUBTITLE,'),
'    ''fa fa-times-circle'' as CARD_ICON,',
'    ''is-danger'' as CARD_COLOR',
'FROM V_AUDIT_CUMPLIMIENTO ',
'',
'UNION ALL',
'',
'SELECT ',
'    ''REVISIONES'' as CARD_TITLE,',
'    TO_CHAR(NVL(COUNT(CASE WHEN ESTADO_CUMPLIMIENTO = ''REVISION_REQUERIDA'' THEN 1 END), 0), ''999,999'') as CARD_VALUE,',
unistr('    ''Cambios que requieren supervisi\00F3n'' as CARD_SUBTITLE,'),
'    ''fa fa-exclamation-triangle'' as CARD_ICON,',
'    ''is-warning'' as CARD_COLOR',
'FROM V_AUDIT_CUMPLIMIENTO ',
'',
'UNION ALL',
'',
'SELECT ',
'    ''HORARIO NOCTURNO'' as CARD_TITLE,',
'    TO_CHAR(NVL(SUM(CAMBIOS_HORARIO_NOCTURNO), 0), ''999,999'') as CARD_VALUE,',
'    ''Cambios entre 00:00-07:59'' as CARD_SUBTITLE,',
'    ''fa fa-moon'' as CARD_ICON,',
'    ''is-info'' as CARD_COLOR',
'FROM V_AUDIT_CUMPLIMIENTO',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(64079996243985489801)
,p_region_id=>wwv_flow_imp.id(64079793912944440106)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_SUBTITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'CARD_VALUE'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'DYNAMIC_CLASS'
,p_icon_class_column_name=>'CARD_ICON'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079798101594440109)
,p_plug_name=>unistr('Distribuci\00F3n por Nivel de Riesgo')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN NIVEL_RIESGO = ''ALTO_RIESGO'' THEN ''Alto Riesgo''',
'        WHEN NIVEL_RIESGO = ''MEDIO_RIESGO'' THEN ''Riesgo Medio''',
'        WHEN NIVEL_RIESGO = ''BAJO_RIESGO'' THEN ''Bajo Riesgo''',
'        ELSE NIVEL_RIESGO',
'    END as LABEL,',
'    COUNT(*) as VALUE',
'FROM V_AUDIT_CUMPLIMIENTO',
'',
'GROUP BY NIVEL_RIESGO',
'ORDER BY ',
'    CASE ',
'        WHEN NIVEL_RIESGO = ''ALTO_RIESGO'' THEN 1',
'        WHEN NIVEL_RIESGO = ''MEDIO_RIESGO'' THEN 2',
'        ELSE 3',
'    END'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(64079798565836440110)
,p_region_id=>wwv_flow_imp.id(64079798101594440109)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079800379728440110)
,p_chart_id=>wwv_flow_imp.id(64079798565836440110)
,p_seq=>10
,p_name=>'Nivel de Riesgo'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(64079799017948440110)
,p_chart_id=>wwv_flow_imp.id(64079798565836440110)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(64079799759852440110)
,p_chart_id=>wwv_flow_imp.id(64079798565836440110)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079996378137489802)
,p_plug_name=>'Actividad por Horario'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''Laboral (8-18)'' as LABEL,',
'    SUM(CAMBIOS_HORARIO_LABORAL) as LABORAL,',
'    ''Extendido (19-23)'' as LABEL2,',
'    SUM(CAMBIOS_HORARIO_EXTENDIDO) as EXTENDIDO,',
'    ''Nocturno (0-7)'' as LABEL3,',
'    SUM(CAMBIOS_HORARIO_NOCTURNO) as NOCTURNO,',
'    ''Fines de Semana'' as LABEL4,',
'    SUM(CAMBIOS_FINES_SEMANA) as FINSEMANA',
'FROM V_AUDIT_CUMPLIMIENTO',
''))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(64079996446327489803)
,p_region_id=>wwv_flow_imp.id(64079996378137489802)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079996548729489804)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_seq=>10
,p_name=>'Horario Laboral'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'LABORAL'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079996939257489808)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_seq=>20
,p_name=>'Horario Extendido'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'EXTENDIDO'
,p_items_label_column_name=>'LABEL2'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079997088802489809)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_seq=>30
,p_name=>'Horario Nocturno'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'NOCTURNO'
,p_items_label_column_name=>'LABEL3'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079997185348489810)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_seq=>40
,p_name=>'Fines de Semana'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'FINSEMANA'
,p_items_label_column_name=>'LABEL4'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(64079996643554489805)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(64079996739797489806)
,p_chart_id=>wwv_flow_imp.id(64079996446327489803)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079997227956489811)
,p_plug_name=>'violaciones de politicas'
,p_title=>unistr('Violaciones de Pol\00EDticas')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    TABLA,',
'    CAMPO,',
'    TOTAL_DELETES as "Eliminaciones",',
'    USUARIOS_INVOLUCRADOS as "Usuarios",',
'    REGISTROS_AFECTADOS as "Registros",',
'    PRIMER_CAMBIO as "Primer Cambio",',
unistr('    ULTIMO_CAMBIO as "\00DAltimo Cambio",'),
'    CAMBIOS_HORARIO_NOCTURNO as "Cambios Nocturnos",',
'    CAMBIOS_FINES_SEMANA as "Cambios Fin Semana",',
'    NIVEL_RIESGO as "Nivel Riesgo",',
'    ESTADO_CUMPLIMIENTO as "Estado"',
'FROM V_AUDIT_CUMPLIMIENTO',
'WHERE ESTADO_CUMPLIMIENTO = ''VIOLACION_POLITICA''',
'',
'ORDER BY TOTAL_DELETES DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>unistr('Violaciones de Pol\00EDticas')
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(64079997382008489812)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'PABLONUNEZ81'
,p_internal_uid=>64079997382008489812
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997451438489813)
,p_db_column_name=>'TABLA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tabla'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997575348489814)
,p_db_column_name=>'CAMPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Campo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997664912489815)
,p_db_column_name=>'Eliminaciones'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Eliminaciones'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997750011489816)
,p_db_column_name=>'Usuarios'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Usuarios'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997827415489817)
,p_db_column_name=>'Registros'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Registros'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079997956665489818)
,p_db_column_name=>'Primer Cambio'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Primer Cambio'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079998069009489819)
,p_db_column_name=>unistr('\00DAltimo Cambio')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('\00DAltimo Cambio')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079998115500489820)
,p_db_column_name=>'Cambios Nocturnos'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Cambios Nocturnos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079998230581489821)
,p_db_column_name=>'Cambios Fin Semana'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Cambios Fin Semana'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079998321053489822)
,p_db_column_name=>'Nivel Riesgo'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Nivel Riesgo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(64079998496898489823)
,p_db_column_name=>'Estado'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(64089895554309777540)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'640898956'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('TABLA:CAMPO:Eliminaciones:Usuarios:Registros:Primer Cambio:\00DAltimo Cambio:Cambios Nocturnos:Cambios Fin Semana:Nivel Riesgo:Estado')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64079999068940489829)
,p_plug_name=>'Estado de Cumplimiento donut'
,p_title=>'Estado de Cumplimiento'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
unistr('        WHEN ESTADO_CUMPLIMIENTO = ''VIOLACION_POLITICA'' THEN ''Violaci\00F3n de Pol\00EDtica'''),
unistr('        WHEN ESTADO_CUMPLIMIENTO = ''REVISION_REQUERIDA'' THEN ''Revisi\00F3n Requerida'''),
unistr('        WHEN ESTADO_CUMPLIMIENTO = ''CUMPLE_POLITICAS'' THEN ''Cumple Pol\00EDticas'''),
'        ELSE ESTADO_CUMPLIMIENTO',
'    END as LABEL,',
'    COUNT(*) as VALUE',
'FROM V_AUDIT_CUMPLIMIENTO',
'GROUP BY ESTADO_CUMPLIMIENTO',
'ORDER BY ',
'    CASE ',
'        WHEN ESTADO_CUMPLIMIENTO = ''VIOLACION_POLITICA'' THEN 1',
'        WHEN ESTADO_CUMPLIMIENTO = ''REVISION_REQUERIDA'' THEN 2',
'        ELSE 3',
'    END'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(64079999152522489830)
,p_region_id=>wwv_flow_imp.id(64079999068940489829)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options) {',
'    options.dataFilter = function(data){',
'        data.series[0].color = "red";',
'        data.series[1].color = "orange";',
'        data.series[2].color = "green";',
'        return data;',
'    };',
'    return options;',
'',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(64079999296367489831)
,p_chart_id=>wwv_flow_imp.id(64079999152522489830)
,p_seq=>10
,p_name=>'New'
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'COMBO'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp.component_end;
end;
/
