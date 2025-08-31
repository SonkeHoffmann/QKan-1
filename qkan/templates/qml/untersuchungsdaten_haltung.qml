<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis symbologyReferenceScale="-1" readOnly="0" simplifyDrawingHints="1" version="3.34.7-Prizren" minScale="100000000" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" simplifyLocal="1" styleCategories="AllStyleCategories" simplifyMaxScale="1" simplifyDrawingTol="1" labelsEnabled="1" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endExpression="to_date(&quot;untersuchtag&quot;)" enabled="0" mode="4" endField="" durationField="" accumulate="0" limitMode="0" startField="" durationUnit="min" startExpression="to_date(&quot;untersuchtag&quot;)" fixedDuration="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation clamping="Terrain" symbology="Line" zoffset="0" showMarkerSymbolInSurfacePlots="0" type="IndividualFeatures" zscale="1" respectLayerSymbol="1" extrusionEnabled="0" extrusion="0" binding="Centroid">
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{f845aede-542c-4a9b-a627-9acb7067498d}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="141,90,153,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.6" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol frame_rate="10" type="fill" force_rhr="0" is_animated="0" name="" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleFill" id="{24f50959-e18a-4127-8e5d-7c334afe6bc7}" locked="0">
          <Option type="Map">
            <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
            <Option type="QString" value="141,90,153,255" name="color"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="101,64,109,255" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.2" name="outline_width"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="solid" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
    <profileMarkerSymbol>
      <symbol frame_rate="10" type="marker" force_rhr="0" is_animated="0" name="" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleMarker" id="{76b770e4-8409-4ddb-a52b-ac083cedbe73}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="141,90,153,255" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="diamond" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="101,64,109,255" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.2" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="3" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileMarkerSymbol>
  </elevation>
  <userNotes value="&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.0//EN&quot; &quot;http://www.w3.org/TR/REC-html40/strict.dtd&quot;>&#xa;&lt;html>&lt;head>&lt;meta name=&quot;qrichtext&quot; content=&quot;1&quot; />&lt;style type=&quot;text/css&quot;>&#xa;p, li { white-space: pre-wrap; }&#xa;&lt;/style>&lt;/head>&lt;body style=&quot; font-family:'MS Shell Dlg 2'; font-size:10pt; font-weight:400; font-style:normal;&quot;>&#xa;&lt;ul style=&quot;margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;&quot;>&lt;li style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Zur Anzeige von Videos und Fotos entsprechende Aktion auswählen&lt;/li>&#xa;&lt;li style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Zur Filterung der angezeigten Schäden entsprechende Aktion im Layer &amp;quot;Zustand_Haltungen_gesamt&amp;quot; auswählen&lt;/li>&lt;/ul>&#xa;&lt;p style=&quot;-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;br />&lt;/p>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;a href=&quot;https://qkan.eu&quot;>&lt;span style=&quot; text-decoration: underline; color:#0000ff;&quot;>Zur QKan-Dokumentation&lt;/span>&lt;/a>&lt;/p>&lt;/body>&lt;/html>"/>
  <renderer-v2 type="RuleRenderer" referencescale="-1" enableorderby="0" forceraster="0" symbollevels="0">
    <rules key="{4c108ca8-1203-477a-9f48-96d4e381b74c}">
      <rule key="{7d940636-afec-4238-8412-8e5bd6db260b}" label="Zustandsklasse 0, starker Mangel" symbol="0" filter="min(ZD, ZB, ZS) = 0"/>
      <rule key="{6ac64b31-87c5-46df-b895-c8f9618ff645}" label="Zustandsklasse 1, starker Mangel" symbol="1" filter="min(ZD, ZB, ZS) = 1"/>
      <rule key="{9c39bafb-a521-44a9-a29e-0fb200ff73c2}" label="Zustandsklasse 2, mittlerer Mangel" symbol="2" filter="min(ZD, ZB, ZS) = 2"/>
      <rule key="{dbe7c6f4-43a6-47c8-8dd3-f4d395b62016}" label="Zustandsklasse 3, leichter Mangel" symbol="3" filter="min(ZD, ZB, ZS) = 3"/>
      <rule key="{857733ab-acb9-405b-aa85-9270d8a95091}" label="Zustandsklasse 4, geringfügiger Mangel" symbol="4" filter="min(ZD, ZB, ZS) = 4"/>
      <rule key="{a5aced04-09fd-409a-9f4b-ca71ca17d7bd}" label="Zustandsklasse 5, kein Mangel" symbol="5" filter="min(ZD, ZB, ZS) = 5"/>
      <rule key="{06fa0df9-3a60-4a3c-a72c-ca8f10d3ad45}" label="nicht ermittelt" symbol="6" filter="(min(ZD, ZB, ZS) &lt; 1 OR min(ZD, ZB, ZS) > 5 OR min(ZD, ZB, ZS) is NULL)"/>
    </rules>
    <symbols>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="0" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{ca46757e-84b9-4628-b428-a898edcbdd2e}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="227,26,28,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="1" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{3fdc5a0e-ed93-4541-9b13-c6412f4a23d2}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="255,127,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="2" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{3c94563f-9032-49c5-8826-670e756b6faa}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="255,255,0,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="3" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{77ef6a68-7203-4c15-a0df-eb4c0539c48a}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="143,207,79,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="4" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{a82c129c-4361-4742-9b38-ef0f917ad18d}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,175,79,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="5" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{d4bfbd78-4a53-4f0f-b6b3-8488d3791e54}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,127,255,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.5" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="6" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{279e1ea9-a9b8-4fbf-bf88-389612f2209c}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="199,199,199,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.26" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" class="SimpleLine" id="{139f50d2-a9c9-42ab-a07d-36898c59914f}" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="35,35,35,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.26" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style fieldName="kuerzel+ ' ' + left(coalesce(charakt1, ' ') + ' ', 1) + ' ' + left(coalesce(charakt2, ' ') + ' ', 1) + ' - '+ format_number( station , 2)" fontWeight="50" fontLetterSpacing="0" textColor="0,0,0,255" allowHtml="0" fontSizeUnit="RenderMetersInMapUnits" fontFamily="Arial" fontStrikeout="0" namedStyle="Standard" useSubstitutions="0" capitalization="0" forcedItalic="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textOpacity="1" multilineHeightUnit="Percentage" isExpression="1" fontItalic="0" fontUnderline="0" fontWordSpacing="0" previewBkgrdColor="255,255,255,255" fontSize="0.25" fontKerning="1" forcedBold="0" blendMode="0" legendString="Aa" textOrientation="horizontal" multilineHeight="1">
        <families/>
        <text-buffer bufferDraw="0" bufferSize="1" bufferColor="255,255,255,255" bufferNoFill="1" bufferSizeUnits="MM" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferOpacity="1" bufferJoinStyle="128" bufferBlendMode="0"/>
        <text-mask maskEnabled="0" maskType="0" maskSizeUnits="MM" maskJoinStyle="128" maskedSymbolLayers="" maskSize="0.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1"/>
        <background shapeBorderWidthUnit="MM" shapeSVGFile="" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="1" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeRadiiUnit="MM" shapeRadiiY="0" shapeOffsetX="0" shapeRotation="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0.29999999999999999" shapeOffsetUnit="MM" shapeFillColor="255,255,255,255" shapeRadiiX="0" shapeJoinStyle="64" shapeType="0" shapeOffsetY="0" shapeSizeType="0" shapeBorderWidth="0" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderColor="128,128,128,255" shapeOpacity="1" shapeSizeY="0.01" shapeBlendMode="0">
          <symbol frame_rate="10" type="marker" force_rhr="0" is_animated="0" name="markerSymbol" alpha="1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleMarker" id="" locked="0">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="164,113,88,255" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="2" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol frame_rate="10" type="fill" force_rhr="0" is_animated="0" name="fillSymbol" alpha="1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer enabled="1" pass="0" class="SimpleFill" id="" locked="0">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="255,255,255,255" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="128,128,128,255" name="outline_color"/>
                <Option type="QString" value="no" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="0" shadowOpacity="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowUnder="0" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowOffsetAngle="135" shadowDraw="0" shadowRadiusUnit="MM" shadowScale="100" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" plussign="0" addDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" wrapChar="" formatNumbers="0" decimals="3" rightDirectionSymbol=">"/>
      <placement rotationAngle="0" distUnits="MM" priority="5" fitInPolygonOnly="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="2" lineAnchorType="1" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placementFlags="9" layerType="LineGeometry" lineAnchorPercent="1" geometryGeneratorEnabled="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" quadOffset="4" maxCurvedCharAngleIn="25" polygonPlacementFlags="2" lineAnchorTextPoint="CenterOfText" preserveRotation="1" overrunDistance="0" centroidWhole="0" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" overrunDistanceUnit="MM" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" allowDegraded="0" repeatDistanceUnits="MM" offsetType="0" overlapHandling="PreventOverlap" xOffset="0" lineAnchorClipping="1" yOffset="0" geometryGeneratorType="PointGeometry" rotationUnit="AngleDegrees" geometryGenerator=""/>
      <rendering fontMinPixelSize="3" zIndex="0" mergeLines="0" scaleMax="2500" scaleMin="1" drawLabels="1" unplacedVisibility="0" obstacle="0" scaleVisibility="1" obstacleFactor="1" minFeatureSize="0" limitNumLabels="0" fontMaxPixelSize="10000" labelPerPart="0" fontLimitPixelSize="0" upsidedownLabels="0" obstacleType="1" maxNumLabels="2000"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Color">
              <Option type="bool" value="true" name="active"/>
              <Option type="QString" value="CASE &#xd;&#xa;WHEN min(ZD, ZB, ZS) = 0 THEN '#FF0000'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 1 THEN '#FF7F00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 2 THEN '#FFFF00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 3 THEN '#8FCF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 4 THEN '#00AF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 5 THEN '#0000FF'END" name="expression"/>
              <Option type="int" value="3" name="type"/>
            </Option>
          </Option>
          <Option type="QString" value="collection" name="type"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
          <Option type="int" value="0" name="blendMode"/>
          <Option type="Map" name="ddProperties">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
          <Option type="bool" value="false" name="drawToAllParts"/>
          <Option type="QString" value="0" name="enabled"/>
          <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
          <Option type="QString" value="&lt;symbol frame_rate=&quot;10&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{082e42aa-acc1-4b60-9787-860ed1a34370}&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
          <Option type="double" value="0" name="minLength"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
          <Option type="QString" value="MM" name="minLengthUnit"/>
          <Option type="double" value="0" name="offsetFromAnchor"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
          <Option type="double" value="0" name="offsetFromLabel"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
          <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <customproperties>
    <Option type="Map">
      <Option type="QString" value="copy" name="QFieldSync/action"/>
      <Option type="QString" value="{}" name="QFieldSync/attachment_naming"/>
      <Option type="QString" value="offline" name="QFieldSync/cloud_action"/>
      <Option type="QString" value="" name="QFieldSync/geometry_locked_expression"/>
      <Option type="QString" value="{}" name="QFieldSync/photo_naming"/>
      <Option type="QString" value="{}" name="QFieldSync/relationship_maximum_visible"/>
      <Option type="int" value="30" name="QFieldSync/tracking_distance_requirement_minimum_meters"/>
      <Option type="int" value="1" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"/>
      <Option type="int" value="0" name="QFieldSync/tracking_measurement_type"/>
      <Option type="int" value="30" name="QFieldSync/tracking_time_requirement_interval_seconds"/>
      <Option type="int" value="0" name="QFieldSync/value_map_button_interface_threshold"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;film_dateiname&quot;"/>
      </Option>
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option type="QString" value="&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.0//EN&quot; &quot;http://www.w3.org/TR/REC-html40/strict.dtd&quot;>&#xa;&lt;html>&lt;head>&lt;meta name=&quot;qrichtext&quot; content=&quot;1&quot; />&lt;style type=&quot;text/css&quot;>&#xa;p, li { white-space: pre-wrap; }&#xa;&lt;/style>&lt;/head>&lt;body style=&quot; font-family:'MS Shell Dlg 2'; font-size:10pt; font-weight:400; font-style:normal;&quot;>&#xa;&lt;ul style=&quot;margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;&quot;>&lt;li style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Zur Anzeige von Videos und Fotos entsprechende Aktion auswählen&lt;/li>&#xa;&lt;li style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Zur Filterung der angezeigten Schäden entsprechende Aktion im Layer &amp;quot;Zustand_Haltungen_gesamt&amp;quot; auswählen&lt;/li>&lt;/ul>&#xa;&lt;p style=&quot;-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;br />&lt;/p>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;a href=&quot;https://qkan.eu&quot;>&lt;span style=&quot; text-decoration: underline; color:#0000ff;&quot;>Zur QKan-Dokumentation&lt;/span>&lt;/a>&lt;/p>&lt;/body>&lt;/html>" name="userNotes"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory enabled="0" backgroundAlpha="255" spacingUnitScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" minScaleDenominator="0" rotationOffset="270" penWidth="0" height="15" opacity="1" diagramOrientation="Up" lineSizeType="MM" penColor="#000000" backgroundColor="#ffffff" scaleDependency="Area" width="15" direction="0" spacingUnit="MM" lineSizeScale="3x:0,0,0,0,0,0" sizeType="MM" penAlpha="255" barWidth="5" minimumSize="0" spacing="5" maxScaleDenominator="1e+08" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" showAxis="1">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" italic="0" underline="0" strikethrough="0" style="" bold="0"/>
      <attribute label="" color="#000000" colorOpacity="1" field=""/>
      <axisSymbol>
        <symbol frame_rate="10" type="line" force_rhr="0" is_animated="0" name="" alpha="1" clip_to_extent="1">
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <layer enabled="1" pass="0" class="SimpleLine" id="{bd6bbe0b-05e7-4a45-985b-d659b8fb80f3}" locked="0">
            <Option type="Map">
              <Option type="QString" value="0" name="align_dash_pattern"/>
              <Option type="QString" value="square" name="capstyle"/>
              <Option type="QString" value="5;2" name="customdash"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
              <Option type="QString" value="MM" name="customdash_unit"/>
              <Option type="QString" value="0" name="dash_pattern_offset"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
              <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
              <Option type="QString" value="0" name="draw_inside_polygon"/>
              <Option type="QString" value="bevel" name="joinstyle"/>
              <Option type="QString" value="35,35,35,255" name="line_color"/>
              <Option type="QString" value="solid" name="line_style"/>
              <Option type="QString" value="0.26" name="line_width"/>
              <Option type="QString" value="MM" name="line_width_unit"/>
              <Option type="QString" value="0" name="offset"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
              <Option type="QString" value="MM" name="offset_unit"/>
              <Option type="QString" value="0" name="ring_filter"/>
              <Option type="QString" value="0" name="trim_distance_end"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
              <Option type="QString" value="MM" name="trim_distance_end_unit"/>
              <Option type="QString" value="0" name="trim_distance_start"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
              <Option type="QString" value="MM" name="trim_distance_start_unit"/>
              <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
              <Option type="QString" value="0" name="use_custom_dash"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
            </Option>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" priority="0" dist="0" showAll="1" obstacle="0" placement="2" zIndex="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="NoFlag" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="untersuchhal">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="schoben">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="schunten">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="untersuchtag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="bandnr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="videozaehler">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="inspektionslaenge">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="station">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="stationtext">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="timecode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="video_offset">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="langtext">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="kuerzel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="charakt1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="charakt2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="quantnr1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="quantnr2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="streckenschaden">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="streckenschaden_lfdnr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="pos_von">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="pos_bis">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="foto_dateiname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="film_dateiname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="ordner_bild">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="ordner_video">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="filmtyp">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="video_start">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="video_ende">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="ZD">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="ZB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="ZS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="dd.MM.yyyy HH:mm:ss" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd HH:mm:ss" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="pk"/>
    <alias index="1" name="Name" field="untersuchhal"/>
    <alias index="2" name="Anfangsschacht" field="schoben"/>
    <alias index="3" name="Endschacht" field="schunten"/>
    <alias index="4" name="Inspektionsnr" field="id"/>
    <alias index="5" name="Inspektionsdatum" field="untersuchtag"/>
    <alias index="6" name="" field="bandnr"/>
    <alias index="7" name="Videozähler" field="videozaehler"/>
    <alias index="8" name="Inspektionslänge" field="inspektionslaenge"/>
    <alias index="9" name="Station" field="station"/>
    <alias index="10" name="Station Text" field="stationtext"/>
    <alias index="11" name="Zeitstempel" field="timecode"/>
    <alias index="12" name="Video Offset" field="video_offset"/>
    <alias index="13" name="" field="langtext"/>
    <alias index="14" name="Kürzel" field="kuerzel"/>
    <alias index="15" name="" field="charakt1"/>
    <alias index="16" name="" field="charakt2"/>
    <alias index="17" name="" field="quantnr1"/>
    <alias index="18" name="" field="quantnr2"/>
    <alias index="19" name="Streckenschaden" field="streckenschaden"/>
    <alias index="20" name="Streckenschaden Laufnummer" field="streckenschaden_lfdnr"/>
    <alias index="21" name="Position Anfang" field="pos_von"/>
    <alias index="22" name="Position Ende" field="pos_bis"/>
    <alias index="23" name="Dateiname Foto" field="foto_dateiname"/>
    <alias index="24" name="Dateiname Film" field="film_dateiname"/>
    <alias index="25" name="Ordner Bild" field="ordner_bild"/>
    <alias index="26" name="Ordner Video" field="ordner_video"/>
    <alias index="27" name="" field="filmtyp"/>
    <alias index="28" name="" field="video_start"/>
    <alias index="29" name="" field="video_ende"/>
    <alias index="30" name="" field="ZD"/>
    <alias index="31" name="" field="ZB"/>
    <alias index="32" name="" field="ZS"/>
    <alias index="33" name="" field="kommentar"/>
    <alias index="34" name="bearbeitet" field="createdat"/>
  </aliases>
  <splitPolicies>
    <policy policy="Duplicate" field="pk"/>
    <policy policy="Duplicate" field="untersuchhal"/>
    <policy policy="Duplicate" field="schoben"/>
    <policy policy="Duplicate" field="schunten"/>
    <policy policy="Duplicate" field="id"/>
    <policy policy="Duplicate" field="untersuchtag"/>
    <policy policy="Duplicate" field="bandnr"/>
    <policy policy="Duplicate" field="videozaehler"/>
    <policy policy="Duplicate" field="inspektionslaenge"/>
    <policy policy="Duplicate" field="station"/>
    <policy policy="Duplicate" field="stationtext"/>
    <policy policy="Duplicate" field="timecode"/>
    <policy policy="Duplicate" field="video_offset"/>
    <policy policy="Duplicate" field="langtext"/>
    <policy policy="Duplicate" field="kuerzel"/>
    <policy policy="Duplicate" field="charakt1"/>
    <policy policy="Duplicate" field="charakt2"/>
    <policy policy="Duplicate" field="quantnr1"/>
    <policy policy="Duplicate" field="quantnr2"/>
    <policy policy="Duplicate" field="streckenschaden"/>
    <policy policy="Duplicate" field="streckenschaden_lfdnr"/>
    <policy policy="Duplicate" field="pos_von"/>
    <policy policy="Duplicate" field="pos_bis"/>
    <policy policy="Duplicate" field="foto_dateiname"/>
    <policy policy="Duplicate" field="film_dateiname"/>
    <policy policy="Duplicate" field="ordner_bild"/>
    <policy policy="Duplicate" field="ordner_video"/>
    <policy policy="Duplicate" field="filmtyp"/>
    <policy policy="Duplicate" field="video_start"/>
    <policy policy="Duplicate" field="video_ende"/>
    <policy policy="Duplicate" field="ZD"/>
    <policy policy="Duplicate" field="ZB"/>
    <policy policy="Duplicate" field="ZS"/>
    <policy policy="Duplicate" field="kommentar"/>
    <policy policy="Duplicate" field="createdat"/>
  </splitPolicies>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="untersuchhal"/>
    <default expression="" applyOnUpdate="0" field="schoben"/>
    <default expression="" applyOnUpdate="0" field="schunten"/>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="untersuchtag"/>
    <default expression="" applyOnUpdate="0" field="bandnr"/>
    <default expression="" applyOnUpdate="0" field="videozaehler"/>
    <default expression="" applyOnUpdate="0" field="inspektionslaenge"/>
    <default expression="" applyOnUpdate="0" field="station"/>
    <default expression="" applyOnUpdate="0" field="stationtext"/>
    <default expression="" applyOnUpdate="0" field="timecode"/>
    <default expression="" applyOnUpdate="0" field="video_offset"/>
    <default expression="" applyOnUpdate="0" field="langtext"/>
    <default expression="" applyOnUpdate="0" field="kuerzel"/>
    <default expression="" applyOnUpdate="0" field="charakt1"/>
    <default expression="" applyOnUpdate="0" field="charakt2"/>
    <default expression="" applyOnUpdate="0" field="quantnr1"/>
    <default expression="" applyOnUpdate="0" field="quantnr2"/>
    <default expression="" applyOnUpdate="0" field="streckenschaden"/>
    <default expression="" applyOnUpdate="0" field="streckenschaden_lfdnr"/>
    <default expression="" applyOnUpdate="0" field="pos_von"/>
    <default expression="" applyOnUpdate="0" field="pos_bis"/>
    <default expression="" applyOnUpdate="0" field="foto_dateiname"/>
    <default expression="" applyOnUpdate="0" field="film_dateiname"/>
    <default expression="" applyOnUpdate="0" field="ordner_bild"/>
    <default expression="" applyOnUpdate="0" field="ordner_video"/>
    <default expression="" applyOnUpdate="0" field="filmtyp"/>
    <default expression="" applyOnUpdate="0" field="video_start"/>
    <default expression="" applyOnUpdate="0" field="video_ende"/>
    <default expression="" applyOnUpdate="0" field="ZD"/>
    <default expression="" applyOnUpdate="0" field="ZB"/>
    <default expression="" applyOnUpdate="0" field="ZS"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression="" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3" field="pk"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="untersuchhal"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="schoben"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="schunten"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="id"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="untersuchtag"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="bandnr"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="videozaehler"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="inspektionslaenge"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="station"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="stationtext"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="timecode"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="video_offset"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="langtext"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="kuerzel"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="charakt1"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="charakt2"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="quantnr1"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="quantnr2"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="streckenschaden"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="streckenschaden_lfdnr"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="pos_von"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="pos_bis"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="foto_dateiname"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="film_dateiname"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ordner_bild"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ordner_video"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="filmtyp"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="video_start"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="video_ende"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ZD"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ZB"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ZS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="untersuchhal"/>
    <constraint exp="" desc="" field="schoben"/>
    <constraint exp="" desc="" field="schunten"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="untersuchtag"/>
    <constraint exp="" desc="" field="bandnr"/>
    <constraint exp="" desc="" field="videozaehler"/>
    <constraint exp="" desc="" field="inspektionslaenge"/>
    <constraint exp="" desc="" field="station"/>
    <constraint exp="" desc="" field="stationtext"/>
    <constraint exp="" desc="" field="timecode"/>
    <constraint exp="" desc="" field="video_offset"/>
    <constraint exp="" desc="" field="langtext"/>
    <constraint exp="" desc="" field="kuerzel"/>
    <constraint exp="" desc="" field="charakt1"/>
    <constraint exp="" desc="" field="charakt2"/>
    <constraint exp="" desc="" field="quantnr1"/>
    <constraint exp="" desc="" field="quantnr2"/>
    <constraint exp="" desc="" field="streckenschaden"/>
    <constraint exp="" desc="" field="streckenschaden_lfdnr"/>
    <constraint exp="" desc="" field="pos_von"/>
    <constraint exp="" desc="" field="pos_bis"/>
    <constraint exp="" desc="" field="foto_dateiname"/>
    <constraint exp="" desc="" field="film_dateiname"/>
    <constraint exp="" desc="" field="ordner_bild"/>
    <constraint exp="" desc="" field="ordner_video"/>
    <constraint exp="" desc="" field="filmtyp"/>
    <constraint exp="" desc="" field="video_start"/>
    <constraint exp="" desc="" field="video_ende"/>
    <constraint exp="" desc="" field="ZD"/>
    <constraint exp="" desc="" field="ZB"/>
    <constraint exp="" desc="" field="ZS"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{3a3384dc-9a4e-4d34-909c-74537cee71fa}"/>
    <actionsetting icon="" type="1" shortTitle="Bild öffnen" capture="0" notificationMessage="" name="Bild öffnen" isEnabledOnlyWhenEditable="0" id="{bb35f5ca-7e7f-44b7-bfaa-ffea0d960666}" action="import matplotlib.pyplot as plt&#xd;&#xa;import matplotlib.image as mpimg&#xd;&#xa;from qgis.PyQt.QtCore import QStandardPaths&#xd;&#xa;import os&#xd;&#xa;import json&#xd;&#xa;import site&#xd;&#xa;from pathlib import Path&#xd;&#xa;&#xd;&#xa;cfile = Path(site.getuserbase()) / &quot;qkan&quot; / &quot;qkan.json&quot;&#xd;&#xa;&#xd;&#xa;with open(cfile, &quot;r&quot;, encoding=&quot;utf-8&quot;) as f:&#xd;&#xa;    data = json.load(f)&#xd;&#xa;    &#xd;&#xa;ordner=data[&quot;fotopath&quot;]&#xd;&#xa;&#xd;&#xa;# Bild laden&#xd;&#xa;if [%foto_dateiname%] is not None:&#xd;&#xa;    bild = mpimg.imread(ordner+'/'+[%foto_dateiname%])&#xd;&#xa;    #bild = mpimg.imread(ordner+'/'+'221500000.jpg')&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;    # Bild anzeigen&#xd;&#xa;    plt.imshow(bild)&#xd;&#xa;    plt.axis(&quot;off&quot;)&#xd;&#xa;    plt.show()&#xd;&#xa;">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting icon="" type="1" shortTitle="" capture="0" notificationMessage="" name="Video abspielen" isEnabledOnlyWhenEditable="0" id="{3a3384dc-9a4e-4d34-909c-74537cee71fa}" action="from qgis.utils import iface&#xd;&#xa;from qgis.core import *&#xd;&#xa;from qgis.gui import QgsMessageBar&#xd;&#xa;import os&#xd;&#xa;from qgis.PyQt.QtCore import QStandardPaths&#xd;&#xa;import json&#xd;&#xa;import site&#xd;&#xa;from pathlib import Path&#xd;&#xa;from qgis.core import QgsApplication&#xd;&#xa;import sys&#xd;&#xa;&#xd;&#xa;qgis_settings_dir = QgsApplication.qgisSettingsDirPath()&#xd;&#xa;&#xd;&#xa;plugin_dir = os.path.join(qgis_settings_dir, &quot;python&quot;, &quot;plugins&quot;)&#xd;&#xa;&#xd;&#xa;sys.path.append(os.path.join(plugin_dir,&quot;qkan&quot;))&#xd;&#xa;&#xd;&#xa;from qkan.database.dbfunc import DBConnection&#xd;&#xa;&#xd;&#xa;from qkan.config import Config&#xd;&#xa;&#xd;&#xa;cfile = Path(site.getuserbase()) / &quot;qkan&quot; / &quot;qkan.json&quot;&#xd;&#xa;&#xd;&#xa;with open(cfile, &quot;r&quot;, encoding=&quot;utf-8&quot;) as f:&#xd;&#xa;    data = json.load(f)&#xd;&#xa;    &#xd;&#xa;ordner=data[&quot;videopath&quot;]&#xd;&#xa;&#xd;&#xa;with DBConnection(dbname=Config.database.qkan) as db_qkan:&#xd;&#xa;&#xd;&#xa;    try:&#xd;&#xa;        from qkan.tools.videoplayer import Videoplayer&#xd;&#xa;&#xd;&#xa;        #video=ordner+'/'+'[%film_dateiname%]'&#xd;&#xa;        name=[%untersuchhal%]&#xd;&#xa;        datum=&quot;[%untersuchtag%]&quot;&#xd;&#xa;        sql = f&quot;&quot;&quot;select datei from videos where name= '{name}' and untersuchtag = '{datum}'&quot;&quot;&quot;&#xd;&#xa;&#xd;&#xa;        db_qkan.sql(sql)&#xd;&#xa;        datei=db_qkan.fetchone()[0]&#xd;&#xa;        #for attr in db_qkan.fetchall():&#xd;&#xa;            #datei = attr[0]&#xd;&#xa;    &#xd;&#xa;            #video=ordner+'/'+'221503943 von 71071047 nach 71071045 - 700 an den birken.mpg'&#xd;&#xa;        video=ordner+'/'+datei&#xd;&#xa;        &#xd;&#xa;        video=video.lower()&#xd;&#xa;        #timecode=[% if(&quot;timecode&quot; = NULL,None,&quot;timecode&quot;)%]&#xd;&#xa;        timecode = None&#xd;&#xa;        timecode=[%CASE WHEN &quot;timecode&quot;  IS NULL THEN 0 ELSE &quot;timecode&quot; END%]&#xd;&#xa;        if timecode == 0:&#xd;&#xa;            window = Videoplayer(video=video, time=0)&#xd;&#xa;        else:&#xd;&#xa;            time_h=int(timecode/1000000) if timecode>1000000 else 0&#xd;&#xa;            time_m=(int(timecode/10000) if timecode>10000 else 0 )-(time_h*100)&#xd;&#xa;            time_s=(int(timecode/100) if timecode>100 else 0 )-(time_h*10000)-(time_m*100)&#xd;&#xa;            &#xd;&#xa;            video_offset= [%CASE WHEN &quot;video_offset&quot;  IS NULL THEN 0 ELSE &quot;video_offset&quot; END%]&#xd;&#xa;            time = float(time_h/3600+time_m/60+time_s+video_offset)&#xd;&#xa;            window = Videoplayer(video=video, time=time)&#xd;&#xa;            &#xd;&#xa;        window.show()&#xd;&#xa;        window.open_file()&#xd;&#xa;        window.exec_()&#xd;&#xa;            &#xd;&#xa;    except ImportError:&#xd;&#xa;        raise Exception(&#xd;&#xa;            &quot;The QKan main plugin has to be installed for this to work.&quot;&#xd;&#xa;         )">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting icon="" type="1" shortTitle="" capture="0" notificationMessage="" name="Panoramo" isEnabledOnlyWhenEditable="0" id="{9af77687-1c82-4624-b777-9a1b9d48ecb3}" action="import matplotlib.pyplot as plt&#xd;&#xa;import matplotlib.image as mpimg&#xd;&#xa;from qgis.PyQt.QtCore import QStandardPaths&#xd;&#xa;import os&#xd;&#xa;import platform&#xd;&#xa;import json&#xd;&#xa;import site&#xd;&#xa;from pathlib import Path&#xd;&#xa;from qgis.core import QgsApplication&#xd;&#xa;import sys&#xd;&#xa;&#xd;&#xa;qgis_settings_dir = QgsApplication.qgisSettingsDirPath()&#xd;&#xa;&#xd;&#xa;plugin_dir = os.path.join(qgis_settings_dir, &quot;python&quot;, &quot;plugins&quot;)&#xd;&#xa;&#xd;&#xa;sys.path.append(os.path.join(plugin_dir,&quot;qkan&quot;))&#xd;&#xa;&#xd;&#xa;from qkan.database.dbfunc import DBConnection&#xd;&#xa;&#xd;&#xa;from qkan.config import Config&#xd;&#xa;&#xd;&#xa;cfile = Path(site.getuserbase()) / &quot;qkan&quot; / &quot;qkan.json&quot;&#xd;&#xa;&#xd;&#xa;with open(cfile, &quot;r&quot;, encoding=&quot;utf-8&quot;) as f:&#xd;&#xa;    data = json.load(f)&#xd;&#xa;    &#xd;&#xa;&#xd;&#xa;ordner=data[&quot;videopath&quot;]&#xd;&#xa;&#xd;&#xa;with DBConnection(dbname=Config.database.qkan) as db_qkan:&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;    #video=ordner+'/'+'[%film_dateiname%]'&#xd;&#xa;    name=[%untersuchhal%]&#xd;&#xa;    datum=&quot;[%untersuchtag%]&quot;&#xd;&#xa;    sql = f&quot;&quot;&quot;select datei from videos where name= '{name}' and untersuchtag = '{datum}'&quot;&quot;&quot;&#xd;&#xa;&#xd;&#xa;    db_qkan.sql(sql)&#xd;&#xa;    datei=db_qkan.fetchone()[0]&#xd;&#xa;    video=ordner+'/'+datei&#xd;&#xa;&#xd;&#xa;    &#xd;&#xa;    video=video.lower()&#xd;&#xa;&#xd;&#xa;    if system == &quot;Windows&quot;:&#xd;&#xa;        os.startfile(video)       # Windows öffnet die Datei mit Standardprogramm&#xd;&#xa;    elif system == &quot;Darwin&quot;:    # macOS&#xd;&#xa;        os.system(f&quot;open '{video}'&quot;)&#xd;&#xa;    else:                       # Linux&#xd;&#xa;        os.system(f&quot;xdg-open '{video}'&quot;)&#xd;&#xa;">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="1" sortExpression="&quot;foto_dateiname&quot;">
    <columns>
      <column type="field" width="-1" name="pk" hidden="0"/>
      <column type="field" width="-1" name="untersuchhal" hidden="0"/>
      <column type="field" width="-1" name="schoben" hidden="0"/>
      <column type="field" width="-1" name="schunten" hidden="0"/>
      <column type="field" width="-1" name="id" hidden="0"/>
      <column type="field" width="-1" name="untersuchtag" hidden="0"/>
      <column type="field" width="-1" name="bandnr" hidden="0"/>
      <column type="field" width="-1" name="videozaehler" hidden="0"/>
      <column type="field" width="-1" name="inspektionslaenge" hidden="0"/>
      <column type="field" width="-1" name="station" hidden="0"/>
      <column type="field" width="-1" name="stationtext" hidden="0"/>
      <column type="field" width="-1" name="timecode" hidden="0"/>
      <column type="field" width="-1" name="video_offset" hidden="0"/>
      <column type="field" width="-1" name="langtext" hidden="0"/>
      <column type="field" width="-1" name="kuerzel" hidden="0"/>
      <column type="field" width="-1" name="charakt1" hidden="0"/>
      <column type="field" width="-1" name="charakt2" hidden="0"/>
      <column type="field" width="-1" name="quantnr1" hidden="0"/>
      <column type="field" width="-1" name="quantnr2" hidden="0"/>
      <column type="field" width="-1" name="streckenschaden" hidden="0"/>
      <column type="field" width="-1" name="streckenschaden_lfdnr" hidden="0"/>
      <column type="field" width="-1" name="pos_von" hidden="0"/>
      <column type="field" width="-1" name="pos_bis" hidden="0"/>
      <column type="field" width="-1" name="foto_dateiname" hidden="0"/>
      <column type="field" width="-1" name="film_dateiname" hidden="0"/>
      <column type="field" width="-1" name="ordner_bild" hidden="0"/>
      <column type="field" width="-1" name="ordner_video" hidden="0"/>
      <column type="field" width="-1" name="filmtyp" hidden="0"/>
      <column type="field" width="-1" name="video_start" hidden="0"/>
      <column type="field" width="-1" name="video_ende" hidden="0"/>
      <column type="field" width="-1" name="ZD" hidden="0"/>
      <column type="field" width="-1" name="ZB" hidden="0"/>
      <column type="field" width="-1" name="ZS" hidden="0"/>
      <column type="field" width="-1" name="kommentar" hidden="0"/>
      <column type="field" width="-1" name="createdat" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users\nb9255e\AppData\Roaming\QGIS\QGIS3\profiles\default\python\plugins\qkan\forms\qkan_untersuchdat_haltung.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field editable="1" name="ZB"/>
    <field editable="1" name="ZD"/>
    <field editable="1" name="ZS"/>
    <field editable="1" name="bandnr"/>
    <field editable="1" name="charakt1"/>
    <field editable="1" name="charakt2"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="film_dateiname"/>
    <field editable="1" name="filmtyp"/>
    <field editable="1" name="foto_dateiname"/>
    <field editable="1" name="id"/>
    <field editable="1" name="inspektionslaenge"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="kuerzel"/>
    <field editable="1" name="langtext"/>
    <field editable="1" name="ordner_bild"/>
    <field editable="1" name="ordner_video"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="pos_bis"/>
    <field editable="1" name="pos_von"/>
    <field editable="1" name="quantnr1"/>
    <field editable="1" name="quantnr2"/>
    <field editable="1" name="richtung"/>
    <field editable="1" name="schoben"/>
    <field editable="1" name="schunten"/>
    <field editable="1" name="station"/>
    <field editable="1" name="stationtext"/>
    <field editable="1" name="streckenschaden"/>
    <field editable="1" name="streckenschaden_lfdnr"/>
    <field editable="1" name="timecode"/>
    <field editable="1" name="untersuchhal"/>
    <field editable="1" name="untersuchrichtung"/>
    <field editable="1" name="untersuchtag"/>
    <field editable="1" name="video_ende"/>
    <field editable="1" name="video_offset"/>
    <field editable="1" name="video_start"/>
    <field editable="1" name="videozaehler"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="ZB"/>
    <field labelOnTop="0" name="ZD"/>
    <field labelOnTop="0" name="ZS"/>
    <field labelOnTop="0" name="bandnr"/>
    <field labelOnTop="0" name="charakt1"/>
    <field labelOnTop="0" name="charakt2"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="film_dateiname"/>
    <field labelOnTop="0" name="filmtyp"/>
    <field labelOnTop="0" name="foto_dateiname"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="inspektionslaenge"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="kuerzel"/>
    <field labelOnTop="0" name="langtext"/>
    <field labelOnTop="0" name="ordner_bild"/>
    <field labelOnTop="0" name="ordner_video"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="pos_bis"/>
    <field labelOnTop="0" name="pos_von"/>
    <field labelOnTop="0" name="quantnr1"/>
    <field labelOnTop="0" name="quantnr2"/>
    <field labelOnTop="0" name="richtung"/>
    <field labelOnTop="0" name="schoben"/>
    <field labelOnTop="0" name="schunten"/>
    <field labelOnTop="0" name="station"/>
    <field labelOnTop="0" name="stationtext"/>
    <field labelOnTop="0" name="streckenschaden"/>
    <field labelOnTop="0" name="streckenschaden_lfdnr"/>
    <field labelOnTop="0" name="timecode"/>
    <field labelOnTop="0" name="untersuchhal"/>
    <field labelOnTop="0" name="untersuchrichtung"/>
    <field labelOnTop="0" name="untersuchtag"/>
    <field labelOnTop="0" name="video_ende"/>
    <field labelOnTop="0" name="video_offset"/>
    <field labelOnTop="0" name="video_start"/>
    <field labelOnTop="0" name="videozaehler"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="ZB"/>
    <field reuseLastValue="0" name="ZD"/>
    <field reuseLastValue="0" name="ZS"/>
    <field reuseLastValue="0" name="bandnr"/>
    <field reuseLastValue="0" name="charakt1"/>
    <field reuseLastValue="0" name="charakt2"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="film_dateiname"/>
    <field reuseLastValue="0" name="filmtyp"/>
    <field reuseLastValue="0" name="foto_dateiname"/>
    <field reuseLastValue="0" name="id"/>
    <field reuseLastValue="0" name="inspektionslaenge"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="kuerzel"/>
    <field reuseLastValue="0" name="langtext"/>
    <field reuseLastValue="0" name="ordner_bild"/>
    <field reuseLastValue="0" name="ordner_video"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="pos_bis"/>
    <field reuseLastValue="0" name="pos_von"/>
    <field reuseLastValue="0" name="quantnr1"/>
    <field reuseLastValue="0" name="quantnr2"/>
    <field reuseLastValue="0" name="richtung"/>
    <field reuseLastValue="0" name="schoben"/>
    <field reuseLastValue="0" name="schunten"/>
    <field reuseLastValue="0" name="station"/>
    <field reuseLastValue="0" name="stationtext"/>
    <field reuseLastValue="0" name="streckenschaden"/>
    <field reuseLastValue="0" name="streckenschaden_lfdnr"/>
    <field reuseLastValue="0" name="timecode"/>
    <field reuseLastValue="0" name="untersuchhal"/>
    <field reuseLastValue="0" name="untersuchrichtung"/>
    <field reuseLastValue="0" name="untersuchtag"/>
    <field reuseLastValue="0" name="video_ende"/>
    <field reuseLastValue="0" name="video_offset"/>
    <field reuseLastValue="0" name="video_start"/>
    <field reuseLastValue="0" name="videozaehler"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"film_dateiname"</previewExpression>
  <mapTip enabled="1"></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
