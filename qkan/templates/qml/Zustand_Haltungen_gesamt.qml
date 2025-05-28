<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" simplifyAlgorithm="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" symbologyReferenceScale="-1" simplifyDrawingTol="1" minScale="100000000" simplifyLocal="1" labelsEnabled="0" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="to_date(&quot;untersuchtag&quot;)" fixedDuration="0" mode="4" limitMode="0" durationField="" enabled="0" durationUnit="min" startExpression="to_date(&quot;untersuchtag&quot;)">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <userNotes value="&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.0//EN&quot; &quot;http://www.w3.org/TR/REC-html40/strict.dtd&quot;>&#xa;&lt;html>&lt;head>&lt;meta name=&quot;qrichtext&quot; content=&quot;1&quot; />&lt;style type=&quot;text/css&quot;>&#xa;p, li { white-space: pre-wrap; }&#xa;&lt;/style>&lt;/head>&lt;body style=&quot; font-family:'MS Shell Dlg 2'; font-size:10pt; font-weight:400; font-style:normal;&quot;>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Filterung nach Inspektionsdatum über das Aktionen-Symbol&lt;/p>&#xa;&lt;p style=&quot;-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;br />&lt;/p>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;a href=&quot;https://qkan.eu&quot;>&lt;span style=&quot; text-decoration: underline; color:#0000ff;&quot;>Zur QKan-Dokumentation&lt;/span>&lt;/a>&lt;/p>&lt;/body>&lt;/html>"/>
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="categorizedSymbol" attr="min(max_ZD, max_ZB, max_ZS)">
    <categories>
      <category symbol="0" value="0" label="Zustandsklasse 0, starker Mangel, Gefahr in Verzug" type="string" render="true"/>
      <category symbol="1" value="1" label="Zustandsklasse 1, starker Mangel" type="string" render="true"/>
      <category symbol="2" value="2" label="Zustandsklasse 2, mittlerer Mangel" type="string" render="true"/>
      <category symbol="3" value="3" label="Zustandsklasse 3, leichter Mangel" type="string" render="true"/>
      <category symbol="4" value="4" label="Zustandsklasse 4, geringfügiger Mangel" type="string" render="true"/>
      <category symbol="5" value="5" label="Zustandsklasse 5, kein Mangel" type="string" render="true"/>
      <category symbol="6" value="" label="nicht ermittelt" type="string" render="true"/>
    </categories>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="255,21,21,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="255,127,0,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="2">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="255,255,0,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="3">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="143,207,79,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="4">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,175,79,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="5">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,127,255,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.5" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="6">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="203,203,203,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="line" frame_rate="10" alpha="1" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="255,127,0,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <Option type="Map">
      <Option value="copy" type="QString" name="QFieldSync/action"/>
      <Option value="{}" type="QString" name="QFieldSync/attachment_naming"/>
      <Option value="offline" type="QString" name="QFieldSync/cloud_action"/>
      <Option value="" type="QString" name="QFieldSync/geometry_locked_expression"/>
      <Option value="{}" type="QString" name="QFieldSync/photo_naming"/>
      <Option value="{}" type="QString" name="QFieldSync/relationship_maximum_visible"/>
      <Option value="30" type="int" name="QFieldSync/tracking_distance_requirement_minimum_meters"/>
      <Option value="1" type="int" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"/>
      <Option value="0" type="int" name="QFieldSync/tracking_measurement_type"/>
      <Option value="30" type="int" name="QFieldSync/tracking_time_requirement_interval_seconds"/>
      <Option value="0" type="int" name="QFieldSync/value_map_button_interface_threshold"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option value="haltnam || ' (' || untersuchtag || ')'" type="QString"/>
      </Option>
      <Option value="0" type="int" name="embeddedWidgets/count"/>
      <Option value="&lt;!DOCTYPE HTML PUBLIC &quot;-//W3C//DTD HTML 4.0//EN&quot; &quot;http://www.w3.org/TR/REC-html40/strict.dtd&quot;>&#xa;&lt;html>&lt;head>&lt;meta name=&quot;qrichtext&quot; content=&quot;1&quot; />&lt;style type=&quot;text/css&quot;>&#xa;p, li { white-space: pre-wrap; }&#xa;&lt;/style>&lt;/head>&lt;body style=&quot; font-family:'MS Shell Dlg 2'; font-size:10pt; font-weight:400; font-style:normal;&quot;>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>Filterung nach Inspektionsdatum über das Aktionen-Symbol&lt;/p>&#xa;&lt;p style=&quot;-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;br />&lt;/p>&#xa;&lt;p style=&quot; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;&quot;>&lt;a href=&quot;https://qkan.eu&quot;>&lt;span style=&quot; text-decoration: underline; color:#0000ff;&quot;>Zur QKan-Dokumentation&lt;/span>&lt;/a>&lt;/p>&lt;/body>&lt;/html>" type="QString" name="userNotes"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="haltnam">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bezugspunkt">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="Rohranfang" type="QString" name="Rohranfang"/>
              </Option>
              <Option type="Map">
                <Option value="Gerinnemittelpunkt" type="QString" name="Gerinnemittelpunkt"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schoben">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schunten">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="hoehe">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="breite">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="laenge">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="baujahr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="untersuchtag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="untersucher">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="untersuchrichtung">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="wetter">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bewertungsart">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bewertungstag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="strasse">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="datenart">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="auftragsbezeichnung">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="max_ZD">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="max_ZB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="max_ZS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="xschob">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="yschob">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="xschun">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="yschun">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="allow_null"/>
            <Option value="true" type="bool" name="calendar_popup"/>
            <Option value="dd.MM.yyyy HH:mm:ss" type="QString" name="display_format"/>
            <Option value="yyyy-MM-dd HH:mm:ss" type="QString" name="field_format"/>
            <Option value="false" type="bool" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="haltnam" index="1" name="Name"/>
    <alias field="bezugspunkt" index="2" name="Bezugspunkt"/>
    <alias field="schoben" index="3" name="Anfangsschacht"/>
    <alias field="schunten" index="4" name="Endschacht"/>
    <alias field="hoehe" index="5" name="Profilhöhe"/>
    <alias field="breite" index="6" name="Profilbreite"/>
    <alias field="laenge" index="7" name="Haltungslänge"/>
    <alias field="baujahr" index="8" name="Baujahr"/>
    <alias field="id" index="9" name="Inspektionsnr"/>
    <alias field="untersuchtag" index="10" name="Inspektionsdatum"/>
    <alias field="untersucher" index="11" name="durchgeführt vom"/>
    <alias field="untersuchrichtung" index="12" name=""/>
    <alias field="wetter" index="13" name="Wetter"/>
    <alias field="bewertungsart" index="14" name="Bewertungsart"/>
    <alias field="bewertungstag" index="15" name="Bewertungstag"/>
    <alias field="strasse" index="16" name=""/>
    <alias field="datenart" index="17" name=""/>
    <alias field="auftragsbezeichnung" index="18" name=""/>
    <alias field="max_ZD" index="19" name=""/>
    <alias field="max_ZB" index="20" name=""/>
    <alias field="max_ZS" index="21" name=""/>
    <alias field="xschob" index="22" name=""/>
    <alias field="yschob" index="23" name=""/>
    <alias field="xschun" index="24" name=""/>
    <alias field="yschun" index="25" name=""/>
    <alias field="kommentar" index="26" name="Kommentar"/>
    <alias field="createdat" index="27" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="haltnam"/>
    <default expression="" applyOnUpdate="0" field="bezugspunkt"/>
    <default expression="" applyOnUpdate="0" field="schoben"/>
    <default expression="" applyOnUpdate="0" field="schunten"/>
    <default expression="" applyOnUpdate="0" field="hoehe"/>
    <default expression="" applyOnUpdate="0" field="breite"/>
    <default expression="" applyOnUpdate="0" field="laenge"/>
    <default expression="" applyOnUpdate="0" field="baujahr"/>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="untersuchtag"/>
    <default expression="" applyOnUpdate="0" field="untersucher"/>
    <default expression="" applyOnUpdate="0" field="untersuchrichtung"/>
    <default expression="" applyOnUpdate="0" field="wetter"/>
    <default expression="" applyOnUpdate="0" field="bewertungsart"/>
    <default expression="" applyOnUpdate="0" field="bewertungstag"/>
    <default expression="" applyOnUpdate="0" field="strasse"/>
    <default expression="" applyOnUpdate="0" field="datenart"/>
    <default expression="" applyOnUpdate="0" field="auftragsbezeichnung"/>
    <default expression="" applyOnUpdate="0" field="max_ZD"/>
    <default expression="" applyOnUpdate="0" field="max_ZB"/>
    <default expression="" applyOnUpdate="0" field="max_ZS"/>
    <default expression="" applyOnUpdate="0" field="xschob"/>
    <default expression="" applyOnUpdate="0" field="yschob"/>
    <default expression="" applyOnUpdate="0" field="xschun"/>
    <default expression="" applyOnUpdate="0" field="yschun"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="haltnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bezugspunkt" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schoben" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schunten" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="hoehe" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="breite" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="laenge" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="baujahr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="id" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="untersuchtag" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="untersucher" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="untersuchrichtung" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="wetter" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bewertungsart" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bewertungstag" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="strasse" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="datenart" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="auftragsbezeichnung" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="max_ZD" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="max_ZB" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="max_ZS" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="xschob" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="yschob" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="xschun" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="yschun" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="haltnam"/>
    <constraint exp="" desc="" field="bezugspunkt"/>
    <constraint exp="" desc="" field="schoben"/>
    <constraint exp="" desc="" field="schunten"/>
    <constraint exp="" desc="" field="hoehe"/>
    <constraint exp="" desc="" field="breite"/>
    <constraint exp="" desc="" field="laenge"/>
    <constraint exp="" desc="" field="baujahr"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="untersuchtag"/>
    <constraint exp="" desc="" field="untersucher"/>
    <constraint exp="" desc="" field="untersuchrichtung"/>
    <constraint exp="" desc="" field="wetter"/>
    <constraint exp="" desc="" field="bewertungsart"/>
    <constraint exp="" desc="" field="bewertungstag"/>
    <constraint exp="" desc="" field="strasse"/>
    <constraint exp="" desc="" field="datenart"/>
    <constraint exp="" desc="" field="auftragsbezeichnung"/>
    <constraint exp="" desc="" field="max_ZD"/>
    <constraint exp="" desc="" field="max_ZB"/>
    <constraint exp="" desc="" field="max_ZS"/>
    <constraint exp="" desc="" field="xschob"/>
    <constraint exp="" desc="" field="yschob"/>
    <constraint exp="" desc="" field="xschun"/>
    <constraint exp="" desc="" field="yschun"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{7f802d16-fd1e-45ac-9683-a33a61fc674b}"/>
    <actionsetting id="{7f802d16-fd1e-45ac-9683-a33a61fc674b}" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="1" notificationMessage="" shortTitle="Aktuelle Zustandsdaten" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowHaltungsschaeden(id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" name="Aktuelle Zustandsdaten für alle Haltungen anzeigen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting id="{89c4a6ee-1b24-4219-996f-61aaebcc49ac}" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="1" notificationMessage="" shortTitle="Aktuelle Zustandsdaten zu Haltung" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowHaltungsschaeden(haltnam = '[%haltnam%]', id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" name="Aktuelle Zustandsdaten zu Haltung anzeigen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting id="{df45edbe-ca08-43ef-85cf-7e9ae15140b0}" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="1" notificationMessage="" shortTitle="Alle Zustandsdaten" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowHaltungsschaeden()&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" name="Alle Zustandsdaten für alle Haltungen anzeigen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting id="{9a8adc00-698b-4b5b-af2b-fbfa3b93d012}" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="1" notificationMessage="" shortTitle="Zustandsdaten zu Haltung und Untersuchungsdatum" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowHaltungsschaeden(haltnam = '[%haltnam%]', untersuchtag = '[%untersuchtag%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" name="Zustandsdaten zu Haltung und Untersuchungsdatum anzeigen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="1" sortExpression="&quot;haltnam&quot;">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="haltnam"/>
      <column hidden="0" type="field" width="151" name="bezugspunkt"/>
      <column hidden="0" type="field" width="-1" name="schoben"/>
      <column hidden="0" type="field" width="-1" name="schunten"/>
      <column hidden="0" type="field" width="-1" name="hoehe"/>
      <column hidden="0" type="field" width="-1" name="breite"/>
      <column hidden="0" type="field" width="-1" name="laenge"/>
      <column hidden="0" type="field" width="-1" name="baujahr"/>
      <column hidden="0" type="field" width="119" name="id"/>
      <column hidden="0" type="field" width="100" name="untersuchtag"/>
      <column hidden="0" type="field" width="142" name="untersucher"/>
      <column hidden="0" type="field" width="146" name="untersuchrichtung"/>
      <column hidden="0" type="field" width="-1" name="wetter"/>
      <column hidden="0" type="field" width="-1" name="bewertungsart"/>
      <column hidden="0" type="field" width="-1" name="bewertungstag"/>
      <column hidden="0" type="field" width="-1" name="strasse"/>
      <column hidden="0" type="field" width="-1" name="datenart"/>
      <column hidden="0" type="field" width="166" name="auftragsbezeichnung"/>
      <column hidden="0" type="field" width="-1" name="max_ZD"/>
      <column hidden="0" type="field" width="-1" name="max_ZB"/>
      <column hidden="0" type="field" width="-1" name="max_ZS"/>
      <column hidden="0" type="field" width="-1" name="xschob"/>
      <column hidden="0" type="field" width="100" name="yschob"/>
      <column hidden="0" type="field" width="100" name="xschun"/>
      <column hidden="0" type="field" width="100" name="yschun"/>
      <column hidden="0" type="field" width="100" name="kommentar"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
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
    <field editable="1" name="auftragsbezeichnung"/>
    <field editable="1" name="baujahr"/>
    <field editable="1" name="bewertungsart"/>
    <field editable="1" name="bewertungstag"/>
    <field editable="1" name="bezugspunkt"/>
    <field editable="1" name="breite"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="datenart"/>
    <field editable="1" name="haltnam"/>
    <field editable="1" name="hoehe"/>
    <field editable="1" name="id"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="laenge"/>
    <field editable="1" name="max_ZB"/>
    <field editable="1" name="max_ZD"/>
    <field editable="1" name="max_ZS"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="schoben"/>
    <field editable="1" name="schunten"/>
    <field editable="1" name="strasse"/>
    <field editable="1" name="untersucher"/>
    <field editable="1" name="untersuchrichtung"/>
    <field editable="1" name="untersuchtag"/>
    <field editable="1" name="wetter"/>
    <field editable="1" name="xschob"/>
    <field editable="1" name="xschun"/>
    <field editable="1" name="yschob"/>
    <field editable="1" name="yschun"/>
  </editable>
  <labelOnTop>
    <field name="auftragsbezeichnung" labelOnTop="0"/>
    <field name="baujahr" labelOnTop="0"/>
    <field name="bewertungsart" labelOnTop="0"/>
    <field name="bewertungstag" labelOnTop="0"/>
    <field name="bezugspunkt" labelOnTop="0"/>
    <field name="breite" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="datenart" labelOnTop="0"/>
    <field name="haltnam" labelOnTop="0"/>
    <field name="hoehe" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="laenge" labelOnTop="0"/>
    <field name="max_ZB" labelOnTop="0"/>
    <field name="max_ZD" labelOnTop="0"/>
    <field name="max_ZS" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="schoben" labelOnTop="0"/>
    <field name="schunten" labelOnTop="0"/>
    <field name="strasse" labelOnTop="0"/>
    <field name="untersucher" labelOnTop="0"/>
    <field name="untersuchrichtung" labelOnTop="0"/>
    <field name="untersuchtag" labelOnTop="0"/>
    <field name="wetter" labelOnTop="0"/>
    <field name="xschob" labelOnTop="0"/>
    <field name="xschun" labelOnTop="0"/>
    <field name="yschob" labelOnTop="0"/>
    <field name="yschun" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="auftragsbezeichnung"/>
    <field reuseLastValue="0" name="baujahr"/>
    <field reuseLastValue="0" name="bewertungsart"/>
    <field reuseLastValue="0" name="bewertungstag"/>
    <field reuseLastValue="1" name="bezugspunkt"/>
    <field reuseLastValue="0" name="breite"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="datenart"/>
    <field reuseLastValue="0" name="haltnam"/>
    <field reuseLastValue="0" name="hoehe"/>
    <field reuseLastValue="0" name="id"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="laenge"/>
    <field reuseLastValue="0" name="max_ZB"/>
    <field reuseLastValue="0" name="max_ZD"/>
    <field reuseLastValue="0" name="max_ZS"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="schoben"/>
    <field reuseLastValue="0" name="schunten"/>
    <field reuseLastValue="0" name="strasse"/>
    <field reuseLastValue="0" name="untersucher"/>
    <field reuseLastValue="0" name="untersuchrichtung"/>
    <field reuseLastValue="0" name="untersuchtag"/>
    <field reuseLastValue="0" name="wetter"/>
    <field reuseLastValue="0" name="xschob"/>
    <field reuseLastValue="0" name="xschun"/>
    <field reuseLastValue="0" name="yschob"/>
    <field reuseLastValue="0" name="yschun"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>haltnam || ' (' || untersuchtag || ')'</previewExpression>
  <mapTip>[% haltnam || ' (' || untersuchtag || ')' %]</mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
