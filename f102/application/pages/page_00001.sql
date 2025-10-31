prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>unistr('Sistema de Gesti\00F3n TI')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32677700937439831907)
,p_plug_name=>'tabs'
,p_title=>'Informes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29962993124463667725)
,p_plug_name=>'Totales'
,p_parent_plug_id=>wwv_flow_imp.id(32677700937439831907)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(56843594981568991166)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29962993440143667728)
,p_plug_name=>'Total_locales'
,p_title=>'Total Locales'
,p_parent_plug_id=>wwv_flow_imp.id(29962993124463667725)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(29962993510240667729)
,p_region_id=>wwv_flow_imp.id(29962993440143667728)
,p_chart_type=>'bar'
,p_title=>'Locales'
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
 p_id=>wwv_flow_imp.id(29962993652354667730)
,p_chart_id=>wwv_flow_imp.id(29962993510240667729)
,p_seq=>10
,p_name=>'Total sitios por zona'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tipo_de_sitio Titulo, count(tipo_de_sitio) total from sgt_sitios',
'where sgt_sitios.zona_id =:P1_FILTRO_ZONA',
'group by tipo_de_sitio',
'order by total desc'))
,p_ajax_items_to_submit=>'P1_FILTRO_ZONA'
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>'TITULO'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32677700608784831904)
,p_chart_id=>wwv_flow_imp.id(29962993510240667729)
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
 p_id=>wwv_flow_imp.id(32677700758113831905)
,p_chart_id=>wwv_flow_imp.id(29962993510240667729)
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
 p_id=>wwv_flow_imp.id(29962993943257667733)
,p_plug_name=>'Total_equipos'
,p_title=>'Total equipos por rack'
,p_parent_plug_id=>wwv_flow_imp.id(29962993124463667725)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(29962994009060667734)
,p_region_id=>wwv_flow_imp.id(29962993943257667733)
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
 p_id=>wwv_flow_imp.id(29962994199263667735)
,p_chart_id=>wwv_flow_imp.id(29962994009060667734)
,p_seq=>10
,p_name=>'Total equipos por rack'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select te.nombre titulo, count(e.tipo_equipo_id) valor from sgt_equipos e left join sgt_tipo_equipos te',
'on e.tipo_equipo_id = te.id',
'WHERE e.rack_id =:P1_FILTRO_RACK',
'',
'group by (e.tipo_equipo_id, te.nombre)',
'',
'order by valor desc'))
,p_ajax_items_to_submit=>'P1_FILTRO_RACK'
,p_items_value_column_name=>'VALOR'
,p_items_label_column_name=>'TITULO'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32677700452982831902)
,p_chart_id=>wwv_flow_imp.id(29962994009060667734)
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
 p_id=>wwv_flow_imp.id(32677700569598831903)
,p_chart_id=>wwv_flow_imp.id(29962994009060667734)
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
 p_id=>wwv_flow_imp.id(29962995029710667744)
,p_plug_name=>'Total equipos por sitio'
,p_title=>'Total equipos por sitio'
,p_parent_plug_id=>wwv_flow_imp.id(29962993124463667725)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(29962995187049667745)
,p_region_id=>wwv_flow_imp.id(29962995029710667744)
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
 p_id=>wwv_flow_imp.id(29962995296138667746)
,p_chart_id=>wwv_flow_imp.id(29962995187049667745)
,p_seq=>10
,p_name=>'Total equipos por sitio'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select te.nombre nombres, count(e.tipo_equipo_id) valores from',
'sgt_equipos e left join sgt_tipo_equipos te on e.tipo_equipo_id = te.id',
'left join sgt_racks r on e.rack_id = r.id',
'',
'where r.sala_id = :FILTRO_TE_SALA',
'',
'group by (e.tipo_equipo_id,te.nombre)',
'order by valores desc'))
,p_ajax_items_to_submit=>'FILTRO_TE_SALA'
,p_items_value_column_name=>'VALORES'
,p_items_label_column_name=>'NOMBRES'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(29962995309923667747)
,p_chart_id=>wwv_flow_imp.id(29962995187049667745)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Equipos por Sala'
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
 p_id=>wwv_flow_imp.id(29962995413793667748)
,p_chart_id=>wwv_flow_imp.id(29962995187049667745)
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
 p_id=>wwv_flow_imp.id(78443842563303367105)
,p_plug_name=>'Total equipos por red'
,p_title=>'Total equipos por red'
,p_parent_plug_id=>wwv_flow_imp.id(29962993124463667725)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(78443842662629367106)
,p_region_id=>wwv_flow_imp.id(78443842563303367105)
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
 p_id=>wwv_flow_imp.id(78443842794327367107)
,p_chart_id=>wwv_flow_imp.id(78443842662629367106)
,p_seq=>10
,p_name=>'Total Tipo Equipos por tipo Red'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Total por tipo de red'' titulo,te.nombre, COUNT(e.id) as valores ',
'FROM sgt_equipos e ',
'LEFT JOIN sgt_tipo_equipos te ON e.tipo_equipo_id = te.id',
'where e.tipo_red = :TIPO_RED',
'GROUP BY te.nombre, te.id;'))
,p_ajax_items_to_submit=>'TIPO_RED'
,p_series_name_column_name=>'TITULO'
,p_items_value_column_name=>'VALORES'
,p_items_label_column_name=>'NOMBRE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(78443842891707367108)
,p_chart_id=>wwv_flow_imp.id(78443842662629367106)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Equipos por tipo de red'
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
 p_id=>wwv_flow_imp.id(78443842915499367109)
,p_chart_id=>wwv_flow_imp.id(78443842662629367106)
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
 p_id=>wwv_flow_imp.id(32677701090044831908)
,p_plug_name=>'Reportes'
,p_title=>'Reportes'
,p_parent_plug_id=>wwv_flow_imp.id(32677700937439831907)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ss.siglas Sitio,',
'    s.siglas AS Sala,',
'    COUNT(DISTINCT r.id) AS total_racks,',
'    COUNT(e.id) AS total_equipos,',
'    COUNT(CASE WHEN e.sub_tipo_equipo = ''activo'' THEN 1 END) AS total_activos,',
'    COUNT(CASE WHEN e.sub_tipo_equipo = ''pasivo'' THEN 1 END) AS total_pasivos,',
unistr('    COUNT(CASE WHEN e.sub_tipo_equipo = ''energ\00EDa''  THEN 1 END) AS total_energia'),
'FROM ',
'    sgt_sitios ss ',
'left join    ',
'    sgt_salas s on s.sitio_id =ss.id',
'LEFT JOIN ',
'    sgt_racks r ON r.sala_id = s.id',
'LEFT JOIN ',
'    sgt_equipos e ON e.rack_id = r.id',
'GROUP BY ',
'    ss.siglas, s.siglas',
'HAVING ',
'    COUNT(DISTINCT r.id) > 0;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_required_role=>wwv_flow_imp.id(56843594981568991166)
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Reportes'
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
,p_plug_header=>'Reporte de totales por Sitio/Sala/Rack'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(45026643190979173741)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'DTEMSC6'
,p_internal_uid=>45026643190979173741
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643211489173742)
,p_db_column_name=>'SITIO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sitio'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643380095173743)
,p_db_column_name=>'SALA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sala'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643468634173744)
,p_db_column_name=>'TOTAL_RACKS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Total Racks'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643539888173745)
,p_db_column_name=>'TOTAL_EQUIPOS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total Equipos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643603757173746)
,p_db_column_name=>'TOTAL_ACTIVOS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total Activos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643723765173747)
,p_db_column_name=>'TOTAL_PASIVOS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Total Pasivos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(45026643887442173748)
,p_db_column_name=>'TOTAL_ENERGIA'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Total Energia'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(47894761790036912687)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'478947618'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SITIO:SALA:TOTAL_RACKS:TOTAL_EQUIPOS:TOTAL_ACTIVOS:TOTAL_PASIVOS:TOTAL_ENERGIA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(78443842166582367101)
,p_plug_name=>'Resumen'
,p_parent_plug_id=>wwv_flow_imp.id(32677700937439831907)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''Total Sitios'' as CARD_TITLE,',
'    COUNT(s.id) || '' Sitios''as CARD_VALUE,',
'    ''locales ANDE'' as CARD_SUBTITLE,',
'    ''fa fa-university'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':25:'' || :APP_SESSION  as href',
'FROM sgt_sitios s',
'',
'UNION ALL',
'',
'SELECT ',
'    ''Total Salas'' as CARD_TITLE,',
'    COUNT(ss.id) || '' Salas'' as CARD_VALUE,',
unistr('    ''Salas comunicaci\00F3n ANDE'' as CARD_SUBTITLE,'),
'    ''fa fa-map-marker'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':4:'' || :APP_SESSION  as href',
'FROM sgt_salas ss',
'UNION ALL',
'',
'SELECT ',
'    ''Total Racks'' as CARD_TITLE,',
'    COUNT(r.id) || '' Racks'' as CARD_VALUE,',
'    ''Racks de ANDE'' as CARD_SUBTITLE,',
'    ''fa fa-server'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':11:'' || :APP_SESSION  as href',
'FROM sgt_racks r',
'',
'UNION ALL',
'',
'SELECT ',
'    ''Total Equipos'' as CARD_TITLE,',
'    COUNT(e.id) ||'' Equipos'' as CARD_VALUE,',
'    ''Activos / Pasivos / Otros'' as CARD_SUBTITLE,',
'    ''fa fa-microchip'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':13:'' || :APP_SESSION  as href',
'FROM sgt_equipos e',
'',
'UNION ALL',
'',
'SELECT ',
'    ''Total Interfaces'' as CARD_TITLE,',
'    COUNT(i.id) ||'' Interfaces'' as CARD_VALUE,',
'    ''Interfaces / Puertos'' as CARD_SUBTITLE,',
'    ''fa fa-'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':8:'' || :APP_SESSION  as href',
'FROM sgt_interfaces i',
'',
'UNION ALL',
'',
'',
'SELECT ',
'    ''Total Servicios'' as CARD_TITLE,',
'    COUNT(srv.id) || '' Servicios'' as CARD_VALUE,',
'    ''Servicios de Comunicaciones'' as CARD_SUBTITLE,',
'    ''fa fa-sitemap-horizontal'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':410:'' || :APP_SESSION  as href',
'FROM sgt_servicios srv',
'',
'union',
'',
'SELECT ',
'    ''Total Enlaces FO'' as CARD_TITLE,',
'    COUNT(fo.id) ||'' Enlaces FO'' as CARD_VALUE,',
'     ',
'    ''Enlaces FO: '' || TO_CHAR(SUM (fo.abs_longitud)/1000,',
'         ''fm999G999G999D00'') || '' km'' as CARD_SUBTITLE,',
'    ''fa fa-sitemap-horizontal'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':36:'' || :APP_SESSION  as href',
'FROM sgt_enlaces_fo fo',
'',
'union ',
'',
'SELECT ',
'    ''Total Enlaces WAN'' as CARD_TITLE,',
'    COUNT(wan.id) || '' Enlaces WAN'' as CARD_VALUE,',
'    ''Enlaces WAN'' as CARD_SUBTITLE,',
'    ''fa fa-sitemap-horizontal'' as CARD_ICON,',
'    ''is-success'' as CARD_COLOR,',
'    ''f?p=''|| :APP_ID || '':34:'' || :APP_SESSION  as href',
'FROM sgt_enlaces_wan wan',
'',
'',
';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_required_role=>wwv_flow_imp.id(56843594981568991166)
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(78443842426016367104)
,p_region_id=>wwv_flow_imp.id(78443842166582367101)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>'<h3 class="a-CardView-title "><a href="&HREF.">&CARD_TITLE.</a></h3>'
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
 p_id=>wwv_flow_imp.id(197180575790845446407)
,p_plug_name=>'sgt-demo'
,p_title=>unistr('Sistema de Gesti\00F3n ANDE/DTE/SC')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29962994438887667738)
,p_name=>'P1_FILTRO_RACK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29962993943257667733)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'Filtro Rack'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'RACKS.NOMBRES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SGT_SITIOS.SIGLAS || ''.''|| SGT_SALAS.SIGLAS ||''.''||SGT_RACKS.NOMBRE AS MOSTRAR , SGT_RACKS.ID AS CLAVE',
'FROM SGT_RACKS INNER JOIN',
'SGT_SALAS ON SGT_RACKS.SALA_ID = SGT_SALAS.ID',
'INNER JOIN',
'SGT_SITIOS ON SGT_SALAS.SITIO_ID = SGT_SITIOS.ID'))
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29962994546232667739)
,p_name=>'P1_FILTRO_ZONA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29962993440143667728)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'Filtro Zona'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_SGT_ZONAS'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29962995514513667749)
,p_name=>'FILTRO_TE_SALA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29962995029710667744)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'Filtro Te Sala'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SALAS.NOMBRE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SGT_SITIOS.SIGLAS || ''.''|| SGT_SALAS.SIGLAS AS MOSTRAR , SGT_SALAS.ID AS CLAVE',
'FROM SGT_SALAS INNER JOIN',
'SGT_SITIOS ON SGT_SALAS.SITIO_ID = SGT_SITIOS.ID'))
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(78443843015764367110)
,p_name=>'TIPO_RED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(78443842563303367105)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'Tipo de Red'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'TIPO_RED'
,p_lov=>'.'||wwv_flow_imp.id(17291432086166556461)||'.'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29962994614208667740)
,p_name=>'ActualizarTotalEquipos'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_FILTRO_RACK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29962994785213667741)
,p_event_id=>wwv_flow_imp.id(29962994614208667740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(29962993943257667733)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29962994853218667742)
,p_name=>'ActualizarLocales'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_FILTRO_ZONA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29962994928883667743)
,p_event_id=>wwv_flow_imp.id(29962994853218667742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(29962993440143667728)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29962995673932667750)
,p_name=>'ActualizarGrafico'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'FILTRO_TE_SALA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32677700310840831901)
,p_event_id=>wwv_flow_imp.id(29962995673932667750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(29962995029710667744)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(78443843173936367111)
,p_name=>'ActualizarTipoRed'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'TIPO_RED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(78443843277421367112)
,p_event_id=>wwv_flow_imp.id(78443843173936367111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(78443842563303367105)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
