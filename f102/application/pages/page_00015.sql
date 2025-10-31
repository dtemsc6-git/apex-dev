prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_name=>'prueba_rack'
,p_alias=>'PRUEBA-RACK'
,p_page_mode=>'MODAL'
,p_step_title=>'prueba_rack'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'table.a-IRR-table {',
'    width: 150px;',
'    margin: 0 auto;',
'}',
'td {',
'    text-align: center;',
'    vertical-align: middle;',
'}'))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16828916084999582983)
,p_name=>'Simulacion_rack'
,p_title=>unistr('Simulaci\00F3n de rack')
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>10
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LEVEL AS "U" ',
'FROM DUAL',
'CONNECT BY LEVEL <= 60;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>60
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16828916177413582984)
,p_query_column_id=>1
,p_column_alias=>'U'
,p_column_display_sequence=>10
,p_column_heading=>'RACK'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::P14_U:#U#'
,p_column_linktext=>'#U#'
,p_column_alignment=>'CENTER'
,p_report_column_width=>300
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
