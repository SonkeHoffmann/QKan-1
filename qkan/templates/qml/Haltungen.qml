<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="1" simplifyDrawingHints="0" simplifyDrawingTol="1" version="3.28.13-Firenze" labelsEnabled="1" symbologyReferenceScale="-1" minScale="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="1" simplifyAlgorithm="0" simplifyLocal="1" readOnly="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" endField="" accumulate="0" startField="" endExpression="" durationField="" limitMode="0" startExpression="" fixedDuration="0" enabled="0" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 type="RuleRenderer" enableorderby="0" symbollevels="0" forceraster="0" referencescale="-1">
    <rules key="{228d5431-8f44-40a0-9f32-4ab249f2b5b8}">
      <rule scalemaxdenom="500" key="{7a315328-c986-4768-8f34-85184ac94014}" label="> 1:500">
        <rule filter="&quot;entwart&quot; = 'Mischwasser'" symbol="0" key="{90add3db-d470-469a-aa61-fb145e19656f}" label="Mischwasser"/>
        <rule filter="&quot;entwart&quot; = 'Regenwasser'" symbol="1" key="{70bf1df3-eafd-463d-b68e-c0f640e20674}" label="Regenwasser"/>
        <rule filter="&quot;entwart&quot; = 'Schmutzwasser'" symbol="2" key="{e7360ab6-96c3-4d12-bb06-015e14a1d486}" label="Schmutzwasser"/>
        <rule filter="&quot;entwart&quot; = 'Rinnen/Gräben'" symbol="3" key="{07e8a2eb-9665-435c-8e87-2c69926e09ac}" label="Rinnen/Gräben"/>
        <rule filter="simstatus IN ('außer Betrieb', 'stillgelegt', 'verdämmert', 'fiktiv', 'rückgebaut')" symbol="4" key="{27ab1c10-b535-4e51-ae40-b7c256e6bd00}" label="stillgelegt"/>
        <rule filter="ELSE" symbol="5" key="{783b79a0-fe47-4163-a434-b1e06b96cacd}" description="sonstige" label="sonstige"/>
      </rule>
      <rule scalemindenom="500" scalemaxdenom="10000" key="{e05438f5-a656-42d1-ac7f-8028b529f31d}" label="1:500 bis 1:10.000">
        <rule filter="&quot;entwart&quot; = 'Mischwasser'" symbol="6" key="{1660e41a-bcee-4000-851b-4ffbd84f067b}" label="Mischwasser"/>
        <rule filter="&quot;entwart&quot; = 'Regenwasser'" symbol="7" key="{6b527d4e-ae32-40c2-8dfc-07c45c96098b}" label="Regenwasser"/>
        <rule filter="&quot;entwart&quot; = 'Schmutzwasser'" symbol="8" key="{e5931154-729e-447c-9f78-f9ab4891db9b}" label="Schmutzwasser"/>
        <rule filter="&quot;entwart&quot; = 'Rinnen/Gräben'" symbol="9" key="{0c427e9f-b674-46d8-b28a-0b704f7beffb}" label="Rinnen/Gräben"/>
        <rule filter="simstatus IN ('außer Betrieb', 'stillgelegt', 'verdämmert', 'fiktiv', 'rückgebaut')" symbol="10" key="{fc37676f-3d16-410e-84a2-40bf9ccf47d0}" label="stillgelegt"/>
        <rule filter="ELSE" symbol="11" key="{dc84e2e3-93cd-49f9-ac6a-c1b72754a900}" description="sonstige" label="sonstige"/>
      </rule>
      <rule filter="True" scalemindenom="10000" symbol="12" key="{2d10dc81-3792-478e-9fdb-6ab4a4cb14f1}" description="weit entfernt" label="&lt; 1:10.000"/>
    </rules>
    <symbols>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1.1 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="173,61,224,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@0@2" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="173,61,224,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1.1 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,63,255,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@1@2" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="0,63,255,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="10" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="4"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="Interval"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="interval">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="int" name="type" value="1"/>
                  <Option type="QString" name="val" value=""/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@10@0" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="255,0,0,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="cross2"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="outline_color" value="255,21,21,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0.5"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="1.4"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="0.6 + 3 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="11" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.44 + 2.2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="127,127,127,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.4 + 2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@11@2" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="203,203,203,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="12" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.8"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="2" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1.1 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="227,26,28,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@2@2" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="area"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="3" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="178,223,138,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1.1 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="51,160,44,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="4" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="1"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="Interval"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="interval">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value=""/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@4@0" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="255,0,0,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="cross2"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="outline_color" value="255,21,21,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0.8"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="5"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="5" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="0,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1.1 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="127,127,127,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="RenderMetersInMapUnits"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@5@2" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="203,203,203,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="6" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="1"/>
            <Option type="QString" name="capstyle" value="flat"/>
            <Option type="QString" name="customdash" value="5;2;2;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="miter"/>
            <Option type="QString" name="line_color" value="174,0,254,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="1"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.4 + 2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@6@1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="173,61,224,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="diameter"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="7" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="1"/>
            <Option type="QString" name="capstyle" value="flat"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="miter"/>
            <Option type="QString" name="line_color" value="0,63,255,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="1"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.4 + 2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@7@1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="0,63,255,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="area"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="8" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="255,0,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.4 + 2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="2" locked="0" enabled="1" class="MarkerLine">
          <Option type="Map">
            <Option type="QString" name="average_angle_length" value="4"/>
            <Option type="QString" name="average_angle_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="average_angle_unit" value="MM"/>
            <Option type="QString" name="interval" value="3"/>
            <Option type="QString" name="interval_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="interval_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_along_line" value="0"/>
            <Option type="QString" name="offset_along_line_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_along_line_unit" value="MM"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="bool" name="place_on_every_part" value="true"/>
            <Option type="QString" name="placements" value="CentralPoint"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="rotate" value="1"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="@8@1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="227,26,28,255"/>
                <Option type="QString" name="horizontal_anchor_point" value="1"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="name" value="filled_arrowhead"/>
                <Option type="QString" name="offset" value="0,0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="MM"/>
                <Option type="QString" name="outline_color" value="0,0,0,255"/>
                <Option type="QString" name="outline_style" value="solid"/>
                <Option type="QString" name="outline_width" value="0"/>
                <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="outline_width_unit" value="MM"/>
                <Option type="QString" name="scale_method" value="area"/>
                <Option type="QString" name="size" value="2"/>
                <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="size_unit" value="MM"/>
                <Option type="QString" name="vertical_anchor_point" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="size">
                      <Option type="bool" name="active" value="true"/>
                      <Option type="QString" name="expression" value="1 + 4 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                      <Option type="int" name="type" value="3"/>
                    </Option>
                  </Option>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol type="line" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="9" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" locked="1" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="178,223,138,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1.1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.44 + 2.2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="1" locked="0" enabled="1" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="round"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="round"/>
            <Option type="QString" name="line_color" value="51,160,44,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="1"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="0.4 + 2 * if(coalesce(breite, 0) = 0,coalesce(hoehe, 1), breite)/1000.0"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{8298fa26-9047-4c2e-b514-fe413cf49036}">
      <rule scalemaxdenom="1000" key="{7aeefd15-894c-49d8-9e60-3ca438a76824}" description="Beschriftung Kreisquerschnitt 1:1000">
        <settings calloutType="simple">
          <text-style forcedItalic="0" fontWordSpacing="0" fontWeight="50" multilineHeightUnit="Percentage" legendString="Aa" fieldName="&quot;haltnam&quot; || '  -  ' || &quot;profilnam&quot;  || '  -  ' ||'DN ' || format_number(hoehe,0) || '  -  ' || format_number(((( sohleoben - sohleunten ) /  laenge )*1000),1) || ' ‰'" fontSize="9" fontLetterSpacing="0" fontItalic="0" textColor="0,0,0,255" fontUnderline="0" blendMode="0" forcedBold="0" capitalization="0" fontKerning="1" multilineHeight="1" namedStyle="Standard" previewBkgrdColor="255,255,255,255" fontSizeMapUnitScale="3x:0,0,0,0,0,0" useSubstitutions="0" fontSizeUnit="Point" isExpression="1" allowHtml="0" fontStrikeout="0" textOrientation="horizontal" textOpacity="1" fontFamily="MS Shell Dlg 2">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="64" bufferColor="255,255,255,255" bufferOpacity="1" bufferBlendMode="0" bufferDraw="1" bufferNoFill="0" bufferSizeUnits="MM" bufferSize="1"/>
            <text-mask maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskOpacity="1" maskEnabled="0" maskJoinStyle="128" maskSize="0" maskedSymbolLayers=""/>
            <background shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeType="0" shapeOffsetY="0" shapeSizeUnit="MM" shapeBlendMode="0" shapeRadiiY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeBorderWidth="0" shapeDraw="0" shapeSizeType="0" shapeRotationType="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeOpacity="1" shapeSVGFile="" shapeOffsetX="0" shapeSizeX="0" shapeRadiiX="0" shapeJoinStyle="64" shapeBorderWidthUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="markerSymbol" clip_to_extent="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" name="name" value=""/>
                    <Option name="properties"/>
                    <Option type="QString" name="type" value="collection"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
                  <Option type="Map">
                    <Option type="QString" name="angle" value="0"/>
                    <Option type="QString" name="cap_style" value="square"/>
                    <Option type="QString" name="color" value="152,125,183,255"/>
                    <Option type="QString" name="horizontal_anchor_point" value="1"/>
                    <Option type="QString" name="joinstyle" value="bevel"/>
                    <Option type="QString" name="name" value="circle"/>
                    <Option type="QString" name="offset" value="0,0"/>
                    <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="offset_unit" value="MM"/>
                    <Option type="QString" name="outline_color" value="35,35,35,255"/>
                    <Option type="QString" name="outline_style" value="solid"/>
                    <Option type="QString" name="outline_width" value="0"/>
                    <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="outline_width_unit" value="MM"/>
                    <Option type="QString" name="scale_method" value="diameter"/>
                    <Option type="QString" name="size" value="2"/>
                    <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="size_unit" value="MM"/>
                    <Option type="QString" name="vertical_anchor_point" value="1"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option name="properties"/>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="fillSymbol" clip_to_extent="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" name="name" value=""/>
                    <Option name="properties"/>
                    <Option type="QString" name="type" value="collection"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" locked="0" enabled="1" class="SimpleFill">
                  <Option type="Map">
                    <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="color" value="255,255,255,255"/>
                    <Option type="QString" name="joinstyle" value="bevel"/>
                    <Option type="QString" name="offset" value="0,0"/>
                    <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="offset_unit" value="MM"/>
                    <Option type="QString" name="outline_color" value="128,128,128,255"/>
                    <Option type="QString" name="outline_style" value="no"/>
                    <Option type="QString" name="outline_width" value="0"/>
                    <Option type="QString" name="outline_width_unit" value="MM"/>
                    <Option type="QString" name="style" value="solid"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option name="properties"/>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowBlendMode="6" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowDraw="0" shadowOffsetAngle="135" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowRadius="0" shadowOpacity="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format multilineAlign="0" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0" plussign="0" autoWrapLength="0" formatNumbers="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" placeDirectionSymbol="0" rightDirectionSymbol=">"/>
          <placement allowDegraded="0" distMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="LineGeometry" lineAnchorType="0" placementFlags="10" geometryGeneratorType="PointGeometry" overrunDistanceUnit="MM" fitInPolygonOnly="0" repeatDistanceUnits="MM" distUnits="MM" polygonPlacementFlags="2" offsetType="0" maxCurvedCharAngleOut="-20" centroidInside="0" dist="2" repeatDistance="0" offsetUnits="MapUnit" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" rotationUnit="AngleDegrees" overrunDistance="0" centroidWhole="0" lineAnchorClipping="0" placement="2" maxCurvedCharAngleIn="20" geometryGeneratorEnabled="0" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" geometryGenerator="" xOffset="0" overlapHandling="PreventOverlap" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" priority="5" rotationAngle="0" lineAnchorTextPoint="CenterOfText" yOffset="0"/>
          <rendering maxNumLabels="2000" obstacleFactor="1" scaleMin="1" upsidedownLabels="0" fontMaxPixelSize="10000" unplacedVisibility="0" fontLimitPixelSize="0" fontMinPixelSize="3" zIndex="0" mergeLines="0" minFeatureSize="0" limitNumLabels="0" obstacleType="0" drawLabels="1" scaleMax="5000" obstacle="1" scaleVisibility="1" labelPerPart="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
              <Option type="int" name="blendMode" value="0"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
              <Option type="bool" name="drawToAllParts" value="false"/>
              <Option type="QString" name="enabled" value="0"/>
              <Option type="QString" name="labelAnchorPoint" value="point_on_exterior"/>
              <Option type="QString" name="lineSymbol" value="&lt;symbol type=&quot;line&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; is_animated=&quot;0&quot; alpha=&quot;1&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;align_dash_pattern&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;capstyle&quot; value=&quot;square&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash&quot; value=&quot;5;2&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;joinstyle&quot; value=&quot;bevel&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_color&quot; value=&quot;60,60,60,255&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_style&quot; value=&quot;solid&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width&quot; value=&quot;0.3&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;ring_filter&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;use_custom_dash&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
              <Option type="double" name="minLength" value="0"/>
              <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="minLengthUnit" value="MM"/>
              <Option type="double" name="offsetFromAnchor" value="0"/>
              <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
              <Option type="double" name="offsetFromLabel" value="0"/>
              <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule scalemindenom="1000" scalemaxdenom="2500" key="{0b02a4c1-7881-45cf-9e9f-858d5ce79b14}" description="Beschriftung Kreisquerschnitt 1:2500">
        <settings calloutType="simple">
          <text-style forcedItalic="0" fontWordSpacing="0" fontWeight="50" multilineHeightUnit="Percentage" legendString="Aa" fieldName="haltnam" fontSize="10" fontLetterSpacing="0" fontItalic="0" textColor="50,50,50,255" fontUnderline="0" blendMode="0" forcedBold="0" capitalization="0" fontKerning="1" multilineHeight="1" namedStyle="Regular" previewBkgrdColor="255,255,255,255" fontSizeMapUnitScale="3x:0,0,0,0,0,0" useSubstitutions="0" fontSizeUnit="Point" isExpression="0" allowHtml="0" fontStrikeout="0" textOrientation="horizontal" textOpacity="1" fontFamily="MS Shell Dlg 2">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferColor="250,250,250,255" bufferOpacity="1" bufferBlendMode="0" bufferDraw="1" bufferNoFill="1" bufferSizeUnits="MM" bufferSize="0.80000000000000004"/>
            <text-mask maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskOpacity="1" maskEnabled="0" maskJoinStyle="128" maskSize="0" maskedSymbolLayers=""/>
            <background shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeType="0" shapeOffsetY="0" shapeSizeUnit="Point" shapeBlendMode="0" shapeRadiiY="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeBorderWidth="0" shapeDraw="0" shapeSizeType="0" shapeRotationType="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="Point" shapeOpacity="1" shapeSVGFile="" shapeOffsetX="0" shapeSizeX="0" shapeRadiiX="0" shapeJoinStyle="64" shapeBorderWidthUnit="Point" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol type="marker" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="markerSymbol" clip_to_extent="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" name="name" value=""/>
                    <Option name="properties"/>
                    <Option type="QString" name="type" value="collection"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
                  <Option type="Map">
                    <Option type="QString" name="angle" value="0"/>
                    <Option type="QString" name="cap_style" value="square"/>
                    <Option type="QString" name="color" value="190,178,151,255"/>
                    <Option type="QString" name="horizontal_anchor_point" value="1"/>
                    <Option type="QString" name="joinstyle" value="bevel"/>
                    <Option type="QString" name="name" value="circle"/>
                    <Option type="QString" name="offset" value="0,0"/>
                    <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="offset_unit" value="MM"/>
                    <Option type="QString" name="outline_color" value="35,35,35,255"/>
                    <Option type="QString" name="outline_style" value="solid"/>
                    <Option type="QString" name="outline_width" value="0"/>
                    <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="outline_width_unit" value="MM"/>
                    <Option type="QString" name="scale_method" value="diameter"/>
                    <Option type="QString" name="size" value="2"/>
                    <Option type="QString" name="size_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="size_unit" value="MM"/>
                    <Option type="QString" name="vertical_anchor_point" value="1"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option name="properties"/>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol type="fill" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="fillSymbol" clip_to_extent="1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" name="name" value=""/>
                    <Option name="properties"/>
                    <Option type="QString" name="type" value="collection"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" locked="0" enabled="1" class="SimpleFill">
                  <Option type="Map">
                    <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="color" value="255,255,255,255"/>
                    <Option type="QString" name="joinstyle" value="bevel"/>
                    <Option type="QString" name="offset" value="0,0"/>
                    <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                    <Option type="QString" name="offset_unit" value="MM"/>
                    <Option type="QString" name="outline_color" value="128,128,128,255"/>
                    <Option type="QString" name="outline_style" value="no"/>
                    <Option type="QString" name="outline_width" value="0"/>
                    <Option type="QString" name="outline_width_unit" value="Point"/>
                    <Option type="QString" name="style" value="solid"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option name="properties"/>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowBlendMode="6" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowDraw="0" shadowOffsetAngle="135" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowRadius="1.5" shadowOpacity="0.69999999999999996"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format multilineAlign="0" useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0" plussign="0" autoWrapLength="0" formatNumbers="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" decimals="3" wrapChar="" placeDirectionSymbol="0" rightDirectionSymbol=">"/>
          <placement allowDegraded="0" distMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="LineGeometry" lineAnchorType="0" placementFlags="10" geometryGeneratorType="PointGeometry" overrunDistanceUnit="MM" fitInPolygonOnly="0" repeatDistanceUnits="MM" distUnits="MM" polygonPlacementFlags="2" offsetType="0" maxCurvedCharAngleOut="-25" centroidInside="0" dist="0" repeatDistance="0" offsetUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="0.5" rotationUnit="AngleDegrees" overrunDistance="0" centroidWhole="0" lineAnchorClipping="0" placement="2" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="0" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" geometryGenerator="" xOffset="0" overlapHandling="PreventOverlap" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" priority="5" rotationAngle="0" lineAnchorTextPoint="CenterOfText" yOffset="0"/>
          <rendering maxNumLabels="2000" obstacleFactor="1" scaleMin="0" upsidedownLabels="0" fontMaxPixelSize="10000" unplacedVisibility="0" fontLimitPixelSize="0" fontMinPixelSize="3" zIndex="0" mergeLines="0" minFeatureSize="0" limitNumLabels="0" obstacleType="1" drawLabels="1" scaleMax="0" obstacle="1" scaleVisibility="0" labelPerPart="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
              <Option type="int" name="blendMode" value="0"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
              <Option type="bool" name="drawToAllParts" value="false"/>
              <Option type="QString" name="enabled" value="0"/>
              <Option type="QString" name="labelAnchorPoint" value="point_on_exterior"/>
              <Option type="QString" name="lineSymbol" value="&lt;symbol type=&quot;line&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; is_animated=&quot;0&quot; alpha=&quot;1&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;align_dash_pattern&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;capstyle&quot; value=&quot;square&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash&quot; value=&quot;5;2&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;joinstyle&quot; value=&quot;bevel&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_color&quot; value=&quot;60,60,60,255&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_style&quot; value=&quot;solid&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width&quot; value=&quot;0.3&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;ring_filter&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;use_custom_dash&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
              <Option type="double" name="minLength" value="0"/>
              <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="minLengthUnit" value="MM"/>
              <Option type="double" name="offsetFromAnchor" value="0"/>
              <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
              <Option type="double" name="offsetFromLabel" value="0"/>
              <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <Option type="Map">
      <Option type="QString" name="QFieldSync/action" value="copy"/>
      <Option type="QString" name="QFieldSync/attachment_naming" value="{}"/>
      <Option type="QString" name="QFieldSync/cloud_action" value="offline"/>
      <Option type="QString" name="QFieldSync/geometry_locked_expression" value=""/>
      <Option type="QString" name="QFieldSync/photo_naming" value="{}"/>
      <Option type="QString" name="QFieldSync/relationship_maximum_visible" value="{}"/>
      <Option type="int" name="QFieldSync/tracking_distance_requirement_minimum_meters" value="30"/>
      <Option type="int" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" value="1"/>
      <Option type="int" name="QFieldSync/tracking_measurement_type" value="0"/>
      <Option type="int" name="QFieldSync/tracking_time_requirement_interval_seconds" value="30"/>
      <Option type="int" name="QFieldSync/value_map_button_interface_threshold" value="0"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;haltnam&quot;"/>
      </Option>
      <Option type="QString" name="embeddedWidgets/count" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>0.51</layerOpacity>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="haltnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schoben">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="schnam"/>
            <Option type="QString" name="Layer" value="Geometrien_53c691ed_4408_4aea_a1e3_95482f944a0b"/>
            <Option type="QString" name="LayerName" value="Geometrien"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='C:/Users/hoettges/Documents/juelich' host=qkan-public.gbd-websuite.de port=5432 user='isce' key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;schaechte&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="schnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schunten">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="schnam"/>
            <Option type="QString" name="Layer" value="Geometrien_53c691ed_4408_4aea_a1e3_95482f944a0b"/>
            <Option type="QString" name="LayerName" value="Geometrien"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='C:/Users/hoettges/Documents/juelich' host=qkan-public.gbd-websuite.de port=5432 user='isce' key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;schaechte&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="schnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="hoehe">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="breite">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="laenge">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="aussendurchmesser">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sohleoben">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="sohleunten">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="baujahr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="eigentum">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="name"/>
            <Option type="QString" name="Layer" value="eigentum_a1c903df_4af8_4ecf_9da6_8892afa11450"/>
            <Option type="QString" name="LayerName" value="Eigentum"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;eigentum&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="name"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="teilgebiet">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="tgnam"/>
            <Option type="QString" name="Layer" value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0"/>
            <Option type="QString" name="LayerName" value="Teilgebiete"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;teilgebiete&quot; (geom)"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="tgnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="strasse">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="profilnam">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="profilnam"/>
            <Option type="QString" name="Layer" value="profile20161018090721921"/>
            <Option type="QString" name="LayerName" value="Profile"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;profile&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="profilnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="entwart">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="bezeichnung"/>
            <Option type="QString" name="Layer" value="entwaesserungsarten20161018090806784"/>
            <Option type="QString" name="LayerName" value="Entwässerungsarten"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;entwaesserungsarten&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="bezeichnung"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="material">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="profilauskleidung">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="innenmaterial">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ks">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="haltungstyp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="simstatus">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="bezeichnung"/>
            <Option type="QString" name="Layer" value="simulationsstatus20161201095050780"/>
            <Option type="QString" name="LayerName" value="Planungsstatus"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;simulationsstatus&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="bezeichnung"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rwanschluss">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="druckdicht">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="int" name="TextDisplayMethod" value="0"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="xschob">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="yschob">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="xschun">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="yschun">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" name="" index="0"/>
    <alias field="haltnam" name="Bezeichnung" index="1"/>
    <alias field="schoben" name="Anfangsschacht" index="2"/>
    <alias field="schunten" name="Endschacht" index="3"/>
    <alias field="hoehe" name="Profilhöhe" index="4"/>
    <alias field="breite" name="Profilbreite" index="5"/>
    <alias field="laenge" name="Haltungslänge" index="6"/>
    <alias field="aussendurchmesser" name="Außendurchmesser" index="7"/>
    <alias field="sohleoben" name="Sohlhöhe Anfang" index="8"/>
    <alias field="sohleunten" name="Sohlhöhe Ende" index="9"/>
    <alias field="baujahr" name="Baujahr" index="10"/>
    <alias field="eigentum" name="Eigentümer" index="11"/>
    <alias field="teilgebiet" name="Teilgebiet" index="12"/>
    <alias field="strasse" name="Straße" index="13"/>
    <alias field="profilnam" name="Profilbezeichnung" index="14"/>
    <alias field="entwart" name="Entwässerungssystem" index="15"/>
    <alias field="material" name="Material" index="16"/>
    <alias field="profilauskleidung" name="Profilauskleidung" index="17"/>
    <alias field="innenmaterial" name="Innenmaterial" index="18"/>
    <alias field="ks" name="Rauheitsbeiwert" index="19"/>
    <alias field="haltungstyp" name="Elementtyp" index="20"/>
    <alias field="simstatus" name="Planungsstatus" index="21"/>
    <alias field="rwanschluss" name="hat RW-Anschlüsse" index="22"/>
    <alias field="druckdicht" name="" index="23"/>
    <alias field="xschob" name="x Anfang" index="24"/>
    <alias field="yschob" name="y Anfang" index="25"/>
    <alias field="xschun" name="x Ende" index="26"/>
    <alias field="yschun" name="y Ende" index="27"/>
    <alias field="kommentar" name="Kommentar" index="28"/>
    <alias field="createdat" name="erstellt" index="29"/>
  </aliases>
  <defaults>
    <default field="pk" applyOnUpdate="0" expression=""/>
    <default field="haltnam" applyOnUpdate="0" expression=""/>
    <default field="schoben" applyOnUpdate="0" expression=""/>
    <default field="schunten" applyOnUpdate="0" expression=""/>
    <default field="hoehe" applyOnUpdate="0" expression=""/>
    <default field="breite" applyOnUpdate="0" expression=""/>
    <default field="laenge" applyOnUpdate="0" expression=""/>
    <default field="aussendurchmesser" applyOnUpdate="0" expression=""/>
    <default field="sohleoben" applyOnUpdate="0" expression=""/>
    <default field="sohleunten" applyOnUpdate="0" expression=""/>
    <default field="baujahr" applyOnUpdate="0" expression=""/>
    <default field="eigentum" applyOnUpdate="0" expression=""/>
    <default field="teilgebiet" applyOnUpdate="0" expression=""/>
    <default field="strasse" applyOnUpdate="0" expression=""/>
    <default field="profilnam" applyOnUpdate="0" expression=""/>
    <default field="entwart" applyOnUpdate="0" expression=""/>
    <default field="material" applyOnUpdate="0" expression=""/>
    <default field="profilauskleidung" applyOnUpdate="0" expression=""/>
    <default field="innenmaterial" applyOnUpdate="0" expression=""/>
    <default field="ks" applyOnUpdate="0" expression=""/>
    <default field="haltungstyp" applyOnUpdate="0" expression=""/>
    <default field="simstatus" applyOnUpdate="0" expression=""/>
    <default field="rwanschluss" applyOnUpdate="0" expression=""/>
    <default field="druckdicht" applyOnUpdate="0" expression=""/>
    <default field="xschob" applyOnUpdate="0" expression=""/>
    <default field="yschob" applyOnUpdate="0" expression=""/>
    <default field="xschun" applyOnUpdate="0" expression=""/>
    <default field="yschun" applyOnUpdate="0" expression=""/>
    <default field="kommentar" applyOnUpdate="0" expression=""/>
    <default field="createdat" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="pk" unique_strength="1" notnull_strength="1" exp_strength="0"/>
    <constraint constraints="0" field="haltnam" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="schoben" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="schunten" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="hoehe" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="breite" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="laenge" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="aussendurchmesser" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="sohleoben" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="sohleunten" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="baujahr" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="eigentum" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="teilgebiet" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="strasse" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="profilnam" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="entwart" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="material" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="profilauskleidung" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="innenmaterial" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="ks" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="haltungstyp" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="simstatus" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="rwanschluss" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="druckdicht" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="xschob" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="yschob" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="xschun" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="yschun" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="kommentar" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="createdat" unique_strength="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="pk" exp=""/>
    <constraint desc="" field="haltnam" exp=""/>
    <constraint desc="" field="schoben" exp=""/>
    <constraint desc="" field="schunten" exp=""/>
    <constraint desc="" field="hoehe" exp=""/>
    <constraint desc="" field="breite" exp=""/>
    <constraint desc="" field="laenge" exp=""/>
    <constraint desc="" field="aussendurchmesser" exp=""/>
    <constraint desc="" field="sohleoben" exp=""/>
    <constraint desc="" field="sohleunten" exp=""/>
    <constraint desc="" field="baujahr" exp=""/>
    <constraint desc="" field="eigentum" exp=""/>
    <constraint desc="" field="teilgebiet" exp=""/>
    <constraint desc="" field="strasse" exp=""/>
    <constraint desc="" field="profilnam" exp=""/>
    <constraint desc="" field="entwart" exp=""/>
    <constraint desc="" field="material" exp=""/>
    <constraint desc="" field="profilauskleidung" exp=""/>
    <constraint desc="" field="innenmaterial" exp=""/>
    <constraint desc="" field="ks" exp=""/>
    <constraint desc="" field="haltungstyp" exp=""/>
    <constraint desc="" field="simstatus" exp=""/>
    <constraint desc="" field="rwanschluss" exp=""/>
    <constraint desc="" field="druckdicht" exp=""/>
    <constraint desc="" field="xschob" exp=""/>
    <constraint desc="" field="yschob" exp=""/>
    <constraint desc="" field="xschun" exp=""/>
    <constraint desc="" field="yschun" exp=""/>
    <constraint desc="" field="kommentar" exp=""/>
    <constraint desc="" field="createdat" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column type="field" width="-1" name="pk" hidden="0"/>
      <column type="field" width="-1" name="haltnam" hidden="0"/>
      <column type="field" width="-1" name="schoben" hidden="0"/>
      <column type="field" width="-1" name="schunten" hidden="0"/>
      <column type="field" width="-1" name="hoehe" hidden="0"/>
      <column type="field" width="-1" name="breite" hidden="0"/>
      <column type="field" width="-1" name="laenge" hidden="0"/>
      <column type="field" width="-1" name="aussendurchmesser" hidden="0"/>
      <column type="field" width="-1" name="sohleoben" hidden="0"/>
      <column type="field" width="-1" name="sohleunten" hidden="0"/>
      <column type="field" width="-1" name="baujahr" hidden="0"/>
      <column type="field" width="-1" name="eigentum" hidden="0"/>
      <column type="field" width="-1" name="teilgebiet" hidden="0"/>
      <column type="field" width="-1" name="strasse" hidden="0"/>
      <column type="field" width="-1" name="profilnam" hidden="0"/>
      <column type="field" width="-1" name="entwart" hidden="0"/>
      <column type="field" width="-1" name="material" hidden="0"/>
      <column type="field" width="-1" name="profilauskleidung" hidden="0"/>
      <column type="field" width="-1" name="innenmaterial" hidden="0"/>
      <column type="field" width="-1" name="ks" hidden="0"/>
      <column type="field" width="-1" name="haltungstyp" hidden="0"/>
      <column type="field" width="-1" name="simstatus" hidden="0"/>
      <column type="field" width="-1" name="rwanschluss" hidden="0"/>
      <column type="field" width="-1" name="druckdicht" hidden="0"/>
      <column type="field" width="-1" name="xschob" hidden="0"/>
      <column type="field" width="-1" name="yschob" hidden="0"/>
      <column type="field" width="-1" name="xschun" hidden="0"/>
      <column type="field" width="-1" name="yschun" hidden="0"/>
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
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_haltungen.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS-Formulare können eine Python-Funktion haben, die beim Öffnen des Formulars gestartet wird.

Hier kann dem Formular Extra-Logik hinzugefügt werden.

Der Name der Funktion wird im Feld "Python-Init-Function" angegeben.
Ein Beispiel:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field editable="1" name="aussendurchmesser"/>
    <field editable="1" name="baujahr"/>
    <field editable="1" name="breite"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="deckeloben"/>
    <field editable="1" name="deckelunten"/>
    <field editable="1" name="druckdicht"/>
    <field editable="1" name="eigentum"/>
    <field editable="1" name="entwart"/>
    <field editable="1" name="haltnam"/>
    <field editable="1" name="haltungstyp"/>
    <field editable="1" name="hoehe"/>
    <field editable="1" name="innenmaterial"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="ks"/>
    <field editable="1" name="laenge"/>
    <field editable="1" name="material"/>
    <field editable="1" name="netztyp"/>
    <field editable="1" name="objekt_id"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="profilauskleidung"/>
    <field editable="1" name="profilnam"/>
    <field editable="1" name="qzu"/>
    <field editable="1" name="rwanschluss"/>
    <field editable="1" name="schoben"/>
    <field editable="1" name="schunten"/>
    <field editable="1" name="simstatus"/>
    <field editable="1" name="sohleoben"/>
    <field editable="1" name="sohleunten"/>
    <field editable="1" name="strasse"/>
    <field editable="1" name="teilgebiet"/>
    <field editable="1" name="xschob"/>
    <field editable="1" name="xschun"/>
    <field editable="1" name="yschob"/>
    <field editable="1" name="yschun"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="aussendurchmesser"/>
    <field labelOnTop="0" name="baujahr"/>
    <field labelOnTop="0" name="breite"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="deckeloben"/>
    <field labelOnTop="0" name="deckelunten"/>
    <field labelOnTop="0" name="druckdicht"/>
    <field labelOnTop="0" name="eigentum"/>
    <field labelOnTop="0" name="entwart"/>
    <field labelOnTop="0" name="haltnam"/>
    <field labelOnTop="0" name="haltungstyp"/>
    <field labelOnTop="0" name="hoehe"/>
    <field labelOnTop="0" name="innenmaterial"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="ks"/>
    <field labelOnTop="0" name="laenge"/>
    <field labelOnTop="0" name="material"/>
    <field labelOnTop="0" name="netztyp"/>
    <field labelOnTop="0" name="objekt_id"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="profilauskleidung"/>
    <field labelOnTop="0" name="profilnam"/>
    <field labelOnTop="0" name="qzu"/>
    <field labelOnTop="0" name="rwanschluss"/>
    <field labelOnTop="0" name="schoben"/>
    <field labelOnTop="0" name="schunten"/>
    <field labelOnTop="0" name="simstatus"/>
    <field labelOnTop="0" name="sohleoben"/>
    <field labelOnTop="0" name="sohleunten"/>
    <field labelOnTop="0" name="strasse"/>
    <field labelOnTop="0" name="teilgebiet"/>
    <field labelOnTop="0" name="xschob"/>
    <field labelOnTop="0" name="xschun"/>
    <field labelOnTop="0" name="yschob"/>
    <field labelOnTop="0" name="yschun"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="aussendurchmesser"/>
    <field reuseLastValue="0" name="baujahr"/>
    <field reuseLastValue="0" name="breite"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="druckdicht"/>
    <field reuseLastValue="1" name="eigentum"/>
    <field reuseLastValue="0" name="entwart"/>
    <field reuseLastValue="0" name="haltnam"/>
    <field reuseLastValue="0" name="haltungstyp"/>
    <field reuseLastValue="0" name="hoehe"/>
    <field reuseLastValue="0" name="innenmaterial"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="ks"/>
    <field reuseLastValue="0" name="laenge"/>
    <field reuseLastValue="0" name="material"/>
    <field reuseLastValue="0" name="netztyp"/>
    <field reuseLastValue="0" name="objekt_id"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="profilauskleidung"/>
    <field reuseLastValue="1" name="profilnam"/>
    <field reuseLastValue="0" name="rwanschluss"/>
    <field reuseLastValue="0" name="schoben"/>
    <field reuseLastValue="0" name="schunten"/>
    <field reuseLastValue="0" name="simstatus"/>
    <field reuseLastValue="0" name="sohleoben"/>
    <field reuseLastValue="0" name="sohleunten"/>
    <field reuseLastValue="0" name="strasse"/>
    <field reuseLastValue="0" name="teilgebiet"/>
    <field reuseLastValue="0" name="xschob"/>
    <field reuseLastValue="0" name="xschun"/>
    <field reuseLastValue="0" name="yschob"/>
    <field reuseLastValue="0" name="yschun"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"haltnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
