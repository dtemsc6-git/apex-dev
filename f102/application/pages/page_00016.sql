prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'TEST_ENLACES_2'
,p_alias=>'TEST_ENLACES2'
,p_step_title=>'Enlaces2'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16844079764360906768)
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
 p_id=>wwv_flow_imp.id(16844081276841906770)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16844082199930906772)
,p_name=>'Master Records'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P16_ID'', p_values => "ID") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P16_ID,''0'') = "ID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("NOMBRE", 1, 50)||( case when length("NOMBRE") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    (substr("ETIQUETA_ENCONTRADA", 1, 50)||( case when length("ETIQUETA_ENCONTRADA") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE',
'from "SGT_ENLACES_FO" x',
'where (:P16_SEARCH is null',
'        or upper(x."NOMBRE") like ''%''||upper(:P16_SEARCH)||''%''',
'        or upper(x."ETIQUETA_ENCONTRADA") like ''%''||upper(:P16_SEARCH)||''%''',
'    )',
'order by "NOMBRE"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P16_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>2093604263195414824
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No data found.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844082974431906776)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844083397578906777)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844083953526906777)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844084323433906777)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844084743585906778)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844085087993906778)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844085499396906778)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844085926965906779)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844086316925906779)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844086702840906779)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16844088203533906847)
,p_name=>'Sgt Enlaces Fo'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'SGT_ENLACES_FO'
,p_query_where=>'"ID" = :P16_ID'
,p_include_rowid_column=>false
,p_display_when_condition=>'P16_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Record Selected'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844088861112906849)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "ID" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844089231136906849)
,p_query_column_id=>2
,p_column_alias=>'ZONA_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Zona Id'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "ZONA_ID" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844089661679906849)
,p_query_column_id=>3
,p_column_alias=>'NOMBRE'
,p_column_display_sequence=>3
,p_column_heading=>'Nombre'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "NOMBRE" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844089995651906850)
,p_query_column_id=>4
,p_column_alias=>'ETIQUETA_ENCONTRADA'
,p_column_display_sequence=>4
,p_column_heading=>'Etiqueta Encontrada'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "ETIQUETA_ENCONTRADA" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844090437995906850)
,p_query_column_id=>5
,p_column_alias=>'OBSERVACIONES_RELEVAMIENTO'
,p_column_display_sequence=>5
,p_column_heading=>'Observaciones Relevamiento'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "OBSERVACIONES_RELEVAMIENTO" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844090798650906850)
,p_query_column_id=>6
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>6
,p_column_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "ESTADO" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844091184968906850)
,p_query_column_id=>7
,p_column_alias=>'CANTIDAD_FO'
,p_column_display_sequence=>7
,p_column_heading=>'Cantidad Fo'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "CANTIDAD_FO" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844091627103906851)
,p_query_column_id=>8
,p_column_alias=>'TIPO_CABLE'
,p_column_display_sequence=>8
,p_column_heading=>'Tipo Cable'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "TIPO_CABLE" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844092039817906851)
,p_query_column_id=>9
,p_column_alias=>'MODO_FO'
,p_column_display_sequence=>9
,p_column_heading=>'Modo Fo'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "MODO_FO" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844092422291906851)
,p_query_column_id=>10
,p_column_alias=>'TIPO_MM'
,p_column_display_sequence=>10
,p_column_heading=>'Tipo Mm'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "TIPO_MM" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844092827616906851)
,p_query_column_id=>11
,p_column_alias=>'TIPO_SM'
,p_column_display_sequence=>11
,p_column_heading=>'Tipo Sm'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "TIPO_SM" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844093194520906852)
,p_query_column_id=>12
,p_column_alias=>'LONGITUD_OTDR'
,p_column_display_sequence=>12
,p_column_heading=>'Longitud Otdr'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "LONGITUD_OTDR" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844093624533906852)
,p_query_column_id=>13
,p_column_alias=>'LONGITUD_CERTIFICACION'
,p_column_display_sequence=>13
,p_column_heading=>'Longitud Certificacion'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "LONGITUD_CERTIFICACION" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844093967387906852)
,p_query_column_id=>14
,p_column_alias=>'PROYECTO_IMPLEMENTACION'
,p_column_display_sequence=>14
,p_column_heading=>'Proyecto Implementacion'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "PROYECTO_IMPLEMENTACION" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844094459188906852)
,p_query_column_id=>15
,p_column_alias=>'IMPLEMENTADO_EL'
,p_column_display_sequence=>15
,p_column_heading=>'Implementado El'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "IMPLEMENTADO_EL" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844094861614906853)
,p_query_column_id=>16
,p_column_alias=>'UNIDAD_ENCARGADA'
,p_column_display_sequence=>16
,p_column_heading=>'Unidad Encargada'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "UNIDAD_ENCARGADA" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844095196274906853)
,p_query_column_id=>17
,p_column_alias=>'CREADO_EL'
,p_column_display_sequence=>17
,p_column_heading=>'Creado El'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "SGT_ENLACES_FO"',
'where "CREADO_EL" is not null',
'and "ID" = :P16_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(42592133402799121700)
,p_query_column_id=>18
,p_column_alias=>'ORIGEN_ID'
,p_column_display_sequence=>27
,p_column_heading=>'Origen Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(42592133254149121699)
,p_query_column_id=>19
,p_column_alias=>'DESTINO_ID'
,p_column_display_sequence=>37
,p_column_heading=>'Destino Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16844106684908906863)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P16_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16844107139703906863)
,p_name=>'Sgt Puertos De Fo'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'SGT_PUERTOS_DE_FO'
,p_query_where=>'"SGT_ENLACES_FO_ID" = :P16_ID'
,p_include_rowid_column=>true
,p_display_when_condition=>'P16_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844108541881906899)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_column_link=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:RP:P18_ROWID:#ROWID#'
,p_column_linktext=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844109006839906899)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'Id'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844109404713906900)
,p_query_column_id=>3
,p_column_alias=>'SGT_ENLACES_FO_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Sgt Enlaces Fo Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844109816534906900)
,p_query_column_id=>4
,p_column_alias=>'EQUIPO_ORIGEN'
,p_column_display_sequence=>4
,p_column_heading=>'Equipo Origen'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844110335917906900)
,p_query_column_id=>5
,p_column_alias=>'PUERTO_ORIGEN'
,p_column_display_sequence=>5
,p_column_heading=>'Puerto Origen'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844110688247906900)
,p_query_column_id=>6
,p_column_alias=>'TIPO_CONECTOR_ORIGEN'
,p_column_display_sequence=>6
,p_column_heading=>'Tipo Conector Origen'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844111070457906901)
,p_query_column_id=>7
,p_column_alias=>'TIPO_PULIDO_ORIGEN'
,p_column_display_sequence=>7
,p_column_heading=>'Tipo Pulido Origen'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844111462790906901)
,p_query_column_id=>8
,p_column_alias=>'EQUIPO_DESTINO'
,p_column_display_sequence=>8
,p_column_heading=>'Equipo Destino'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844111913111906901)
,p_query_column_id=>9
,p_column_alias=>'PUERTO_DESTINO'
,p_column_display_sequence=>9
,p_column_heading=>'Puerto Destino'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844112264039906901)
,p_query_column_id=>10
,p_column_alias=>'TIPO_CONECTOR_DESTINO'
,p_column_display_sequence=>10
,p_column_heading=>'Tipo Conector Destino'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844112694110906902)
,p_query_column_id=>11
,p_column_alias=>'TIPO_PULIDO_DESTINO'
,p_column_display_sequence=>11
,p_column_heading=>'Tipo Pulido Destino'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844113064854906902)
,p_query_column_id=>12
,p_column_alias=>'ESTADO'
,p_column_display_sequence=>12
,p_column_heading=>'Estado'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16844113473945906902)
,p_query_column_id=>13
,p_column_alias=>'FUNCION'
,p_column_display_sequence=>13
,p_column_heading=>'Funcion'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16844135845394906996)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>70
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P16_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16844118494658906907)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16844107139703906863)
,p_button_name=>'POP_SGT_PUERTOS_DE_FO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Sgt Puertos De Fo'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&APP_SESSION.::&DEBUG.:RP,18:P18_SGT_ENLACES_FO_ID:&P16_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16844136265586906997)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(16844088203533906847)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:RP,17:P17_ID:&P16_ID.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16844080574474906769)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16844079764360906768)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&APP_SESSION.:RESET:&DEBUG.:RP,16::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16844080985878906770)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(16844079764360906768)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:RP,17::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16844081896026906772)
,p_name=>'P16_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16844081276841906770)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16844106370374906863)
,p_name=>'P16_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16844088203533906847)
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16844136584038906997)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(16844088203533906847)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844137161364906997)
,p_event_id=>wwv_flow_imp.id(16844136584038906997)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16844088203533906847)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844137586802906998)
,p_event_id=>wwv_flow_imp.id(16844136584038906997)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Sgt Enlaces Fo row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16844107244159906863)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(16844107139703906863)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844119215732906907)
,p_event_id=>wwv_flow_imp.id(16844107244159906863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16844107139703906863)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844119704079906908)
,p_event_id=>wwv_flow_imp.id(16844107244159906863)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Sgt Puertos De Fo row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16844136711240906997)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844138454578906998)
,p_event_id=>wwv_flow_imp.id(16844136711240906997)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16844082199930906772)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16844138902567906998)
,p_event_id=>wwv_flow_imp.id(16844136711240906997)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp.component_end;
end;
/
