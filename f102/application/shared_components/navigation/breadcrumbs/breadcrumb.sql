prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>71533046799736978747
,p_default_application_id=>24839
,p_default_id_offset=>9071155675752509
,p_default_owner=>'WKSP_DTESC'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(197180072443235446203)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2245132638776954)
,p_short_name=>'Mapa Sitios'
,p_link=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:::'
,p_page_id=>47
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16823534894042212508)
,p_short_name=>'Enlaces'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16844080318703906768)
,p_short_name=>'Enlaces2'
,p_link=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(37204295089123013533)
,p_parent_id=>wwv_flow_imp.id(200805781466576280031)
,p_short_name=>'Interfaces'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(41049503005705235047)
,p_short_name=>'SGT_CABLES'
,p_link=>'f?p=&APP_ID.:32:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>32
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43769697891503608887)
,p_short_name=>'Enlaces Wan'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(43997219234025517996)
,p_short_name=>'Enlaces FO'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(44129486238859328243)
,p_short_name=>'Servicios'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(44132907443677381963)
,p_short_name=>'Conexiones'
,p_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:::'
,p_page_id=>39
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(47197334404430019195)
,p_short_name=>'Vista de conexiones'
,p_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::'
,p_page_id=>43
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(56800692870322124528)
,p_short_name=>'Control de Accesos'
,p_link=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10000
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(59777350785241233353)
,p_short_name=>unistr('Auditor\00EDa General')
,p_link=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:::'
,p_page_id=>46
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(62045886816914196969)
,p_short_name=>unistr('Dashboard de Gesti\00F3n de Auditor\00EDa - \00DAltimos 30 d\00EDas')
,p_link=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_page_id=>100
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(64079793723434440105)
,p_short_name=>unistr('Dashboard de Cumplimiento de pol\00EDticas y patrones de riesgo - \00DAltimos 90 d\00EDas')
,p_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_page_id=>200
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(79639294754475205028)
,p_short_name=>unistr('Visualizar Topolog\00EDa')
,p_link=>'f?p=&APP_ID.:400:&SESSION.::&DEBUG.:::'
,p_page_id=>400
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(86192634127870544724)
,p_short_name=>'Vista Servicios'
,p_long_name=>'Vista General de los servicios'
,p_link=>'f?p=&APP_ID.:410:&SESSION.::&DEBUG.:::'
,p_page_id=>410
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(117115182895578411768)
,p_short_name=>'Sitios'
,p_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:::'
,p_page_id=>25
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(117116224489950765985)
,p_short_name=>'Ciudades'
,p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(118015534741522003225)
,p_short_name=>'Departamentos'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(197180072625137446203)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(200703031338888282559)
,p_short_name=>'Sitios 2'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(200718430323993803903)
,p_short_name=>'Racks'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(200805781466576280031)
,p_short_name=>'Equipos'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(202695224080943202497)
,p_short_name=>'Zonas'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(202814184707018557272)
,p_short_name=>'Salas'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp.component_end;
end;
/
