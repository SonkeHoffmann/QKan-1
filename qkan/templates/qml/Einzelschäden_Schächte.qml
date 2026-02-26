<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="100000000" simplifyDrawingHints="0" symbologyReferenceScale="-1" simplifyDrawingTol="1" simplifyLocal="1" labelsEnabled="1" simplifyAlgorithm="0" version="3.28.13-Firenze" simplifyMaxScale="1" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationField="" accumulate="0" enabled="0" durationUnit="min" startExpression="to_date(&quot;untersuchtag&quot;)" fixedDuration="0" mode="4" limitMode="0" endExpression="to_date(&quot;untersuchtag&quot;)" startField="" endField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 symbollevels="0" forceraster="0" referencescale="-1" type="RuleRenderer" enableorderby="0">
    <rules key="{4c108ca8-1203-477a-9f48-96d4e381b74c}">
      <rule key="{14f6fa52-828b-4173-9779-a734185c7d50}" filter="min(ZD, ZB, ZS) = 0" label="Zustandsklasse 0, starker Mangel, Gefahr im Verzug" symbol="0"/>
      <rule key="{7d940636-afec-4238-8412-8e5bd6db260b}" filter="min(ZD, ZB, ZS) = 1" label="Zustandsklasse 1, starker Mangel" symbol="1"/>
      <rule key="{9c39bafb-a521-44a9-a29e-0fb200ff73c2}" filter="min(ZD, ZB, ZS) = 2" label="Zustandsklasse 2, mittlerer Mangel" symbol="2"/>
      <rule key="{dbe7c6f4-43a6-47c8-8dd3-f4d395b62016}" filter="min(ZD, ZB, ZS) = 3" label="Zustandsklasse 3, leichter Mangel" symbol="3"/>
      <rule key="{857733ab-acb9-405b-aa85-9270d8a95091}" filter="min(ZD, ZB, ZS) = 4" label="Zustandsklasse 4, geringfügiger Mangel" symbol="4"/>
      <rule key="{a5aced04-09fd-409a-9f4b-ca71ca17d7bd}" filter="min(ZD, ZB, ZS) = 5" label="Zustandsklasse 5, kein Mangel" symbol="5"/>
      <rule key="{06fa0df9-3a60-4a3c-a72c-ca8f10d3ad45}" filter="ELSE" label="nicht ermittelt" symbol="6"/>
    </rules>
    <symbols>
      <symbol type="line" clip_to_extent="1" name="0" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="227,26,28,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="1" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,127,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="2" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="255,255,0,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="3" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="143,207,79,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="4" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="0,175,79,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="5" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="0,127,255,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.5"/>
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
      <symbol type="line" clip_to_extent="1" name="6" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleLine" locked="0">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="199,199,199,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="0.26"/>
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
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style fontKerning="1" fontUnderline="0" textOrientation="horizontal" multilineHeightUnit="Percentage" fontSizeMapUnitScale="3x:0,0,0,0,0,0" isExpression="1" fontWeight="50" textOpacity="1" capitalization="0" blendMode="0" fontSize="0.25" fontFamily="Arial" fontLetterSpacing="0" allowHtml="0" fontStrikeout="0" textColor="0,0,0,255" fontItalic="0" fontWordSpacing="0" useSubstitutions="0" forcedBold="0" previewBkgrdColor="255,255,255,255" legendString="Aa" multilineHeight="1" fontSizeUnit="RenderMetersInMapUnits" forcedItalic="0" namedStyle="Standard" fieldName="kuerzel+ ' ' + left(coalesce(charakt1, ' ') + ' ', 1) + ' ' + left(coalesce(charakt2, ' ') + ' ', 1)">
        <families/>
        <text-buffer bufferOpacity="1" bufferNoFill="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferBlendMode="0" bufferColor="255,255,255,255" bufferJoinStyle="128" bufferDraw="0" bufferSizeUnits="MM"/>
        <text-mask maskSizeUnits="MM" maskedSymbolLayers="" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128" maskType="0" maskOpacity="1" maskSize="0.5" maskEnabled="0"/>
        <background shapeOffsetUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeSizeX="0.29999999999999999" shapeRadiiY="0" shapeRadiiUnit="MM" shapeFillColor="255,255,255,255" shapeOffsetX="0" shapeRotation="0" shapeJoinStyle="64" shapeBorderWidthUnit="MM" shapeOpacity="1" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeRadiiX="0" shapeOffsetY="0" shapeBorderWidth="0" shapeDraw="1" shapeSizeType="0" shapeSizeUnit="RenderMetersInMapUnits" shapeRotationType="0" shapeSVGFile="" shapeSizeY="0.01" shapeBorderColor="128,128,128,255">
          <symbol type="marker" clip_to_extent="1" name="markerSymbol" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" class="SimpleMarker" locked="0">
              <Option type="Map">
                <Option type="QString" name="angle" value="0"/>
                <Option type="QString" name="cap_style" value="square"/>
                <Option type="QString" name="color" value="164,113,88,255"/>
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
          <symbol type="fill" clip_to_extent="1" name="fillSymbol" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" class="SimpleFill" locked="0">
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
        <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0" shadowDraw="0" shadowUnder="0" shadowRadius="0" shadowBlendMode="6" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowScale="100"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format decimals="3" plussign="0" rightDirectionSymbol=">" autoWrapLength="0" reverseDirectionSymbol="0" formatNumbers="0" addDirectionSymbol="0" placeDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" wrapChar="" multilineAlign="0"/>
      <placement overlapHandling="AllowOverlapIfRequired" rotationUnit="AngleDegrees" dist="0" yOffset="0" lineAnchorPercent="1" preserveRotation="1" xOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" placement="2" layerType="LineGeometry" maxCurvedCharAngleOut="-25" rotationAngle="0" lineAnchorTextPoint="CenterOfText" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" lineAnchorType="1" overrunDistanceUnit="MM" fitInPolygonOnly="0" priority="5" polygonPlacementFlags="2" centroidInside="0" allowDegraded="1" geometryGenerator="" geometryGeneratorEnabled="0" distMapUnitScale="3x:0,0,0,0,0,0" placementFlags="9" distUnits="MM" overrunDistance="0" repeatDistanceUnits="MM" geometryGeneratorType="PointGeometry" offsetUnits="MM" lineAnchorClipping="1" centroidWhole="0" repeatDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" offsetType="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="25"/>
      <rendering scaleMax="2500" upsidedownLabels="0" fontLimitPixelSize="0" obstacleType="1" zIndex="0" obstacleFactor="1" labelPerPart="0" scaleVisibility="1" scaleMin="1" maxNumLabels="2000" fontMaxPixelSize="10000" obstacle="0" minFeatureSize="0" unplacedVisibility="0" drawLabels="1" mergeLines="0" limitNumLabels="0" fontMinPixelSize="3"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Color">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="CASE &#xd;&#xa;WHEN min(ZD, ZB, ZS) = 0 THEN '#FF0000'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 1 THEN '#FF7F00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 2 THEN '#FFFF00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 3 THEN '#8FCF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 4 THEN '#00AF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 5 THEN '#0000FF'END"/>
              <Option type="int" name="type" value="3"/>
            </Option>
          </Option>
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
          <Option type="QString" name="lineSymbol" value="&lt;symbol type=&quot;line&quot; clip_to_extent=&quot;1&quot; name=&quot;symbol&quot; alpha=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;align_dash_pattern&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;capstyle&quot; value=&quot;square&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash&quot; value=&quot;5;2&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;customdash_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;joinstyle&quot; value=&quot;bevel&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_color&quot; value=&quot;60,60,60,255&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_style&quot; value=&quot;solid&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width&quot; value=&quot;0.3&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;line_width_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;offset_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;ring_filter&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;use_custom_dash&quot; value=&quot;0&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
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
        <Option type="QString" value="&quot;langtext&quot;"/>
      </Option>
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option type="invalid" name="variableNames"/>
      <Option type="invalid" name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="untersuchsch" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="untersuchtag" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bandnr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="videozaehler" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="timecode" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="langtext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="charakt1" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="charakt2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="quantnr1" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="quantnr2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="streckenschaden" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="streckenschaden_lfdnr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pos_von" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pos_bis" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="vertikale_lage" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="inspektionslaenge" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bereich" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="foto_dateiname" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ordner_bild" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="film_dateiname" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ordner_video" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="filmtyp" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="video_start" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="video_ende" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ZD" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ZB" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ZS" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
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
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="untersuchsch"/>
    <alias name="Inspektionsnr" index="2" field="id"/>
    <alias name="Inspektionsdatum" index="3" field="untersuchtag"/>
    <alias name="" index="4" field="bandnr"/>
    <alias name="Videozähler" index="5" field="videozaehler"/>
    <alias name="Zeitstempel" index="6" field="timecode"/>
    <alias name="" index="7" field="langtext"/>
    <alias name="Kürzel" index="8" field="kuerzel"/>
    <alias name="" index="9" field="charakt1"/>
    <alias name="" index="10" field="charakt2"/>
    <alias name="" index="11" field="quantnr1"/>
    <alias name="" index="12" field="quantnr2"/>
    <alias name="Streckenschaden" index="13" field="streckenschaden"/>
    <alias name="Streckenschäden Laufnummer" index="14" field="streckenschaden_lfdnr"/>
    <alias name="Position Anfang" index="15" field="pos_von"/>
    <alias name="Position Ende" index="16" field="pos_bis"/>
    <alias name="Länge vertikal" index="17" field="vertikale_lage"/>
    <alias name="Inspektionslänge" index="18" field="inspektionslaenge"/>
    <alias name="Bereich" index="19" field="bereich"/>
    <alias name="Dateiname Foto" index="20" field="foto_dateiname"/>
    <alias name="Ordner Fotos" index="21" field="ordner_bild"/>
    <alias name="" index="22" field="film_dateiname"/>
    <alias name="" index="23" field="ordner_video"/>
    <alias name="" index="24" field="filmtyp"/>
    <alias name="" index="25" field="video_start"/>
    <alias name="" index="26" field="video_ende"/>
    <alias name="" index="27" field="ZD"/>
    <alias name="" index="28" field="ZB"/>
    <alias name="" index="29" field="ZS"/>
    <alias name="" index="30" field="kommentar"/>
    <alias name="bearbeitet" index="31" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="untersuchsch"/>
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="" field="untersuchtag"/>
    <default applyOnUpdate="0" expression="" field="bandnr"/>
    <default applyOnUpdate="0" expression="" field="videozaehler"/>
    <default applyOnUpdate="0" expression="" field="timecode"/>
    <default applyOnUpdate="0" expression="" field="langtext"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="" field="charakt1"/>
    <default applyOnUpdate="0" expression="" field="charakt2"/>
    <default applyOnUpdate="0" expression="" field="quantnr1"/>
    <default applyOnUpdate="0" expression="" field="quantnr2"/>
    <default applyOnUpdate="0" expression="" field="streckenschaden"/>
    <default applyOnUpdate="0" expression="" field="streckenschaden_lfdnr"/>
    <default applyOnUpdate="0" expression="" field="pos_von"/>
    <default applyOnUpdate="0" expression="" field="pos_bis"/>
    <default applyOnUpdate="0" expression="" field="vertikale_lage"/>
    <default applyOnUpdate="0" expression="" field="inspektionslaenge"/>
    <default applyOnUpdate="0" expression="" field="bereich"/>
    <default applyOnUpdate="0" expression="" field="foto_dateiname"/>
    <default applyOnUpdate="0" expression="" field="ordner_bild"/>
    <default applyOnUpdate="0" expression="" field="film_dateiname"/>
    <default applyOnUpdate="0" expression="" field="ordner_video"/>
    <default applyOnUpdate="0" expression="" field="filmtyp"/>
    <default applyOnUpdate="0" expression="" field="video_start"/>
    <default applyOnUpdate="0" expression="" field="video_ende"/>
    <default applyOnUpdate="0" expression="" field="ZD"/>
    <default applyOnUpdate="0" expression="" field="ZB"/>
    <default applyOnUpdate="0" expression="" field="ZS"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression="" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="untersuchsch"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="id"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="untersuchtag"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bandnr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="videozaehler"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="timecode"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="langtext"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kuerzel"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="charakt1"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="charakt2"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="quantnr1"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="quantnr2"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="streckenschaden"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="streckenschaden_lfdnr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pos_von"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="pos_bis"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="vertikale_lage"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="inspektionslaenge"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bereich"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="foto_dateiname"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ordner_bild"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="film_dateiname"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ordner_video"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="filmtyp"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="video_start"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="video_ende"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ZD"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ZB"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="ZS"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="untersuchsch"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="untersuchtag"/>
    <constraint exp="" desc="" field="bandnr"/>
    <constraint exp="" desc="" field="videozaehler"/>
    <constraint exp="" desc="" field="timecode"/>
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
    <constraint exp="" desc="" field="vertikale_lage"/>
    <constraint exp="" desc="" field="inspektionslaenge"/>
    <constraint exp="" desc="" field="bereich"/>
    <constraint exp="" desc="" field="foto_dateiname"/>
    <constraint exp="" desc="" field="ordner_bild"/>
    <constraint exp="" desc="" field="film_dateiname"/>
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
    <defaultAction key="Canvas" value="{bb35f5ca-7e7f-44b7-bfaa-ffea0d960666}"/>
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Bild öffnen" shortTitle="Bild öffnen" id="{bb35f5ca-7e7f-44b7-bfaa-ffea0d960666}" notificationMessage="" action="import matplotlib.pyplot as plt&#xd;&#xa;import matplotlib.image as mpimg&#xd;&#xa;from qgis.PyQt.QtCore import QStandardPaths&#xd;&#xa;import os&#xd;&#xa;import json&#xd;&#xa;import site&#xd;&#xa;from pathlib import Path&#xd;&#xa;&#xd;&#xa;cfile = Path(site.getuserbase()) / &quot;qkan&quot; / &quot;qkan.json&quot;&#xd;&#xa;&#xd;&#xa;with open(cfile, &quot;r&quot;, encoding=&quot;utf-8&quot;) as f:&#xd;&#xa;    data = json.load(f)&#xd;&#xa;    &#xd;&#xa;ordner=data[&quot;fotopath&quot;]&#xd;&#xa;&#xd;&#xa;# Bild laden&#xd;&#xa;x='[%foto_dateiname%]'&#xd;&#xa;if x != '':&#xd;&#xa;    bild = mpimg.imread(ordner+'/'+'[%foto_dateiname%]')&#xd;&#xa;    #bild = mpimg.imread(ordner+'/'+'221500000.jpg')&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;    # Bild anzeigen&#xd;&#xa;    plt.figure()&#xd;&#xa;    plt.imshow(bild)&#xd;&#xa;    plt.axis(&quot;off&quot;)&#xd;&#xa;    plt.show()&#xd;&#xa;" capture="0">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Video abspielen" shortTitle="Video abspielen" id="{3a3384dc-9a4e-4d34-909c-74537cee71fa}" notificationMessage="" action="from qgis.utils import iface&#xd;&#xa;from qgis.core import *&#xd;&#xa;from qgis.gui import QgsMessageBar&#xd;&#xa;import os&#xd;&#xa;from qgis.PyQt.QtCore import QStandardPaths&#xd;&#xa;import json&#xd;&#xa;import site&#xd;&#xa;from pathlib import Path&#xd;&#xa;from qgis.core import QgsApplication&#xd;&#xa;import sys&#xd;&#xa;&#xd;&#xa;qgis_settings_dir = QgsApplication.qgisSettingsDirPath()&#xd;&#xa;&#xd;&#xa;plugin_dir = os.path.join(qgis_settings_dir, &quot;python&quot;, &quot;plugins&quot;)&#xd;&#xa;&#xd;&#xa;sys.path.append(os.path.join(plugin_dir,&quot;qkan&quot;))&#xd;&#xa;&#xd;&#xa;from qkan.database.dbfunc import DBConnection&#xd;&#xa;&#xd;&#xa;from qkan.config import Config&#xd;&#xa;&#xd;&#xa;cfile = Path(site.getuserbase()) / &quot;qkan&quot; / &quot;qkan.json&quot;&#xd;&#xa;&#xd;&#xa;with open(cfile, &quot;r&quot;, encoding=&quot;utf-8&quot;) as f:&#xd;&#xa;    data = json.load(f)&#xd;&#xa;    &#xd;&#xa;ordner=data[&quot;videopath&quot;]&#xd;&#xa;&#xd;&#xa;with DBConnection(dbname=Config.database.qkan) as db_qkan:&#xd;&#xa;&#xd;&#xa;    try:&#xd;&#xa;        from qkan.tools.videoplayer import Videoplayer&#xd;&#xa;&#xd;&#xa;        #video=ordner+'/'+'[%film_dateiname%]'&#xd;&#xa;        name='[%untersuchhal%]'&#xd;&#xa;        datum=&quot;[%untersuchtag%]&quot;&#xd;&#xa;        sql = f&quot;&quot;&quot;select datei from videos where name= '{name}' and untersuchtag = '{datum}'&quot;&quot;&quot;&#xd;&#xa;&#xd;&#xa;        db_qkan.sql(sql)&#xd;&#xa;        datei=db_qkan.fetchone()[0]&#xd;&#xa;        #for attr in db_qkan.fetchall():&#xd;&#xa;            #datei = attr[0]&#xd;&#xa;    &#xd;&#xa;            #video=ordner+'/'+'221503943 von 71071047 nach 71071045 - 700 an den birken.mpg'&#xd;&#xa;        video=ordner+'/'+datei&#xd;&#xa;        &#xd;&#xa;        video=video.lower()&#xd;&#xa;        #timecode=[% if(&quot;timecode&quot; = NULL,None,&quot;timecode&quot;)%]&#xd;&#xa;        timecode = None&#xd;&#xa;        timecode=[%CASE WHEN &quot;timecode&quot;  IS NULL THEN 0 ELSE &quot;timecode&quot; END%]&#xd;&#xa;        if timecode == 0:&#xd;&#xa;            window = Videoplayer(video=video, time=0)&#xd;&#xa;        else:&#xd;&#xa;            time_h=int(timecode/1000000) if timecode>1000000 else 0&#xd;&#xa;            time_m=(int(timecode/10000) if timecode>10000 else 0 )-(time_h*100)&#xd;&#xa;            time_s=(int(timecode/100) if timecode>100 else 0 )-(time_h*10000)-(time_m*100)&#xd;&#xa;            &#xd;&#xa;            video_offset= [%CASE WHEN &quot;video_offset&quot;  IS NULL THEN 0 ELSE &quot;video_offset&quot; END%]&#xd;&#xa;            time = float(time_h/3600+time_m/60+time_s+video_offset)&#xd;&#xa;            window = Videoplayer(video=video, time=time)&#xd;&#xa;            &#xd;&#xa;        window.show()&#xd;&#xa;        window.open_file()&#xd;&#xa;        window.exec_()&#xd;&#xa;            &#xd;&#xa;    except ImportError:&#xd;&#xa;        raise Exception(&#xd;&#xa;            &quot;The QKan main plugin has to be installed for this to work.&quot;&#xd;&#xa;         )" capture="0">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="untersuchsch" hidden="0"/>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="untersuchtag" hidden="0"/>
      <column width="-1" type="field" name="bandnr" hidden="0"/>
      <column width="-1" type="field" name="videozaehler" hidden="0"/>
      <column width="-1" type="field" name="timecode" hidden="0"/>
      <column width="-1" type="field" name="langtext" hidden="0"/>
      <column width="-1" type="field" name="kuerzel" hidden="0"/>
      <column width="-1" type="field" name="charakt1" hidden="0"/>
      <column width="-1" type="field" name="charakt2" hidden="0"/>
      <column width="-1" type="field" name="quantnr1" hidden="0"/>
      <column width="-1" type="field" name="quantnr2" hidden="0"/>
      <column width="-1" type="field" name="streckenschaden" hidden="0"/>
      <column width="-1" type="field" name="streckenschaden_lfdnr" hidden="0"/>
      <column width="-1" type="field" name="pos_von" hidden="0"/>
      <column width="-1" type="field" name="pos_bis" hidden="0"/>
      <column width="-1" type="field" name="vertikale_lage" hidden="0"/>
      <column width="-1" type="field" name="inspektionslaenge" hidden="0"/>
      <column width="-1" type="field" name="bereich" hidden="0"/>
      <column width="-1" type="field" name="foto_dateiname" hidden="0"/>
      <column width="-1" type="field" name="ordner_bild" hidden="0"/>
      <column width="-1" type="field" name="film_dateiname" hidden="0"/>
      <column width="-1" type="field" name="ordner_video" hidden="0"/>
      <column width="-1" type="field" name="filmtyp" hidden="0"/>
      <column width="-1" type="field" name="video_start" hidden="0"/>
      <column width="-1" type="field" name="video_ende" hidden="0"/>
      <column width="-1" type="field" name="ZD" hidden="0"/>
      <column width="-1" type="field" name="ZB" hidden="0"/>
      <column width="-1" type="field" name="ZS" hidden="0"/>
      <column width="-1" type="field" name="kommentar" hidden="0"/>
      <column width="-1" type="field" name="createdat" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <field editable="1" name="ZB"/>
    <field editable="1" name="ZD"/>
    <field editable="1" name="ZS"/>
    <field editable="1" name="bandnr"/>
    <field editable="1" name="bereich"/>
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
    <field editable="1" name="streckenschaden"/>
    <field editable="1" name="streckenschaden_lfdnr"/>
    <field editable="1" name="timecode"/>
    <field editable="1" name="untersuchsch"/>
    <field editable="1" name="untersuchtag"/>
    <field editable="1" name="vertikale_lage"/>
    <field editable="1" name="video_ende"/>
    <field editable="1" name="video_start"/>
    <field editable="1" name="videozaehler"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="ZB"/>
    <field labelOnTop="0" name="ZD"/>
    <field labelOnTop="0" name="ZS"/>
    <field labelOnTop="0" name="bandnr"/>
    <field labelOnTop="0" name="bereich"/>
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
    <field labelOnTop="0" name="streckenschaden"/>
    <field labelOnTop="0" name="streckenschaden_lfdnr"/>
    <field labelOnTop="0" name="timecode"/>
    <field labelOnTop="0" name="untersuchsch"/>
    <field labelOnTop="0" name="untersuchtag"/>
    <field labelOnTop="0" name="vertikale_lage"/>
    <field labelOnTop="0" name="video_ende"/>
    <field labelOnTop="0" name="video_start"/>
    <field labelOnTop="0" name="videozaehler"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="ZB" reuseLastValue="0"/>
    <field name="ZD" reuseLastValue="0"/>
    <field name="ZS" reuseLastValue="0"/>
    <field name="bandnr" reuseLastValue="0"/>
    <field name="bereich" reuseLastValue="0"/>
    <field name="charakt1" reuseLastValue="0"/>
    <field name="charakt2" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="film_dateiname" reuseLastValue="0"/>
    <field name="filmtyp" reuseLastValue="0"/>
    <field name="foto_dateiname" reuseLastValue="0"/>
    <field name="id" reuseLastValue="0"/>
    <field name="inspektionslaenge" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="langtext" reuseLastValue="0"/>
    <field name="ordner_bild" reuseLastValue="0"/>
    <field name="ordner_video" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="pos_bis" reuseLastValue="0"/>
    <field name="pos_von" reuseLastValue="0"/>
    <field name="quantnr1" reuseLastValue="0"/>
    <field name="quantnr2" reuseLastValue="0"/>
    <field name="streckenschaden" reuseLastValue="0"/>
    <field name="streckenschaden_lfdnr" reuseLastValue="0"/>
    <field name="timecode" reuseLastValue="0"/>
    <field name="untersuchsch" reuseLastValue="0"/>
    <field name="untersuchtag" reuseLastValue="0"/>
    <field name="vertikale_lage" reuseLastValue="0"/>
    <field name="video_ende" reuseLastValue="0"/>
    <field name="video_start" reuseLastValue="0"/>
    <field name="videozaehler" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"langtext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
