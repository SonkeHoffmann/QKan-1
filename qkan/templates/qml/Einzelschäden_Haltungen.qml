<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" simplifyMaxScale="1" simplifyDrawingHints="1" simplifyLocal="1" labelsEnabled="1" symbologyReferenceScale="-1" readOnly="0" hasScaleBasedVisibilityFlag="0" minScale="100000000" simplifyDrawingTol="1" version="3.28.13-Firenze" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal startExpression="to_date(&quot;untersuchtag&quot;)" fixedDuration="0" durationUnit="min" limitMode="0" endExpression="to_date(&quot;untersuchtag&quot;)" durationField="" accumulate="0" mode="4" enabled="0" endField="" startField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 referencescale="-1" symbollevels="0" type="RuleRenderer" forceraster="0" enableorderby="0">
    <rules key="{4c108ca8-1203-477a-9f48-96d4e381b74c}">
      <rule filter="min(ZD, ZB, ZS) = 0" symbol="0" label="Zustandsklasse 0, starker Mangel" key="{7d940636-afec-4238-8412-8e5bd6db260b}"/>
      <rule filter="min(ZD, ZB, ZS) = 1" symbol="1" label="Zustandsklasse 1, starker Mangel" key="{6ac64b31-87c5-46df-b895-c8f9618ff645}"/>
      <rule filter="min(ZD, ZB, ZS) = 2" symbol="2" label="Zustandsklasse 2, mittlerer Mangel" key="{9c39bafb-a521-44a9-a29e-0fb200ff73c2}"/>
      <rule filter="min(ZD, ZB, ZS) = 3" symbol="3" label="Zustandsklasse 3, leichter Mangel" key="{dbe7c6f4-43a6-47c8-8dd3-f4d395b62016}"/>
      <rule filter="min(ZD, ZB, ZS) = 4" symbol="4" label="Zustandsklasse 4, geringfügiger Mangel" key="{857733ab-acb9-405b-aa85-9270d8a95091}"/>
      <rule filter="min(ZD, ZB, ZS) = 5" symbol="5" label="Zustandsklasse 5, kein Mangel" key="{a5aced04-09fd-409a-9f4b-ca71ca17d7bd}"/>
      <rule filter="(min(ZD, ZB, ZS) &lt; 1 OR min(ZD, ZB, ZS) > 5)" symbol="6" label="nicht ermittelt" key="{06fa0df9-3a60-4a3c-a72c-ca8f10d3ad45}"/>
    </rules>
    <symbols>
      <symbol name="0" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="227,26,28,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="255,127,0,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="2" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="255,255,0,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="3" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="143,207,79,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="4" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="0,175,79,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="5" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="0,127,255,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.5"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="6" type="line" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" pass="0" locked="0" enabled="1">
          <Option type="Map">
            <Option name="align_dash_pattern" type="QString" value="0"/>
            <Option name="capstyle" type="QString" value="square"/>
            <Option name="customdash" type="QString" value="5;2"/>
            <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="customdash_unit" type="QString" value="MM"/>
            <Option name="dash_pattern_offset" type="QString" value="0"/>
            <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
            <Option name="draw_inside_polygon" type="QString" value="0"/>
            <Option name="joinstyle" type="QString" value="bevel"/>
            <Option name="line_color" type="QString" value="199,199,199,255"/>
            <Option name="line_style" type="QString" value="solid"/>
            <Option name="line_width" type="QString" value="0.26"/>
            <Option name="line_width_unit" type="QString" value="MM"/>
            <Option name="offset" type="QString" value="0"/>
            <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="offset_unit" type="QString" value="MM"/>
            <Option name="ring_filter" type="QString" value="0"/>
            <Option name="trim_distance_end" type="QString" value="0"/>
            <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_end_unit" type="QString" value="MM"/>
            <Option name="trim_distance_start" type="QString" value="0"/>
            <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
            <Option name="trim_distance_start_unit" type="QString" value="MM"/>
            <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
            <Option name="use_custom_dash" type="QString" value="0"/>
            <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style useSubstitutions="0" namedStyle="Standard" fieldName="kuerzel+ ' ' + left(coalesce(charakt1, ' ') + ' ', 1) + ' ' + left(coalesce(charakt2, ' ') + ' ', 1) + ' - '+ format_number( station , 2)" previewBkgrdColor="255,255,255,255" fontLetterSpacing="0" legendString="Aa" multilineHeightUnit="Percentage" allowHtml="0" fontUnderline="0" textOrientation="horizontal" fontSize="0.25" fontStrikeout="0" fontWordSpacing="0" textColor="0,0,0,255" fontWeight="50" capitalization="0" fontSizeUnit="RenderMetersInMapUnits" fontItalic="0" fontFamily="Arial" blendMode="0" forcedBold="0" multilineHeight="1" isExpression="1" forcedItalic="0" fontKerning="1" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0">
        <families/>
        <text-buffer bufferDraw="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferBlendMode="0" bufferColor="255,255,255,255" bufferNoFill="1" bufferSize="1" bufferOpacity="1" bufferSizeUnits="MM"/>
        <text-mask maskSize="0.5" maskJoinStyle="128" maskEnabled="0" maskType="0" maskedSymbolLayers="" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskOpacity="1"/>
        <background shapeOffsetUnit="MM" shapeSizeUnit="RenderMetersInMapUnits" shapeOpacity="1" shapeRadiiUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeRadiiX="0" shapeSVGFile="" shapeDraw="1" shapeRotationType="0" shapeRotation="0" shapeOffsetX="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeSizeX="0.29999999999999999" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeFillColor="255,255,255,255" shapeType="0" shapeSizeY="0.01" shapeBorderColor="128,128,128,255">
          <symbol name="markerSymbol" type="marker" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" pass="0" locked="0" enabled="1">
              <Option type="Map">
                <Option name="angle" type="QString" value="0"/>
                <Option name="cap_style" type="QString" value="square"/>
                <Option name="color" type="QString" value="164,113,88,255"/>
                <Option name="horizontal_anchor_point" type="QString" value="1"/>
                <Option name="joinstyle" type="QString" value="bevel"/>
                <Option name="name" type="QString" value="circle"/>
                <Option name="offset" type="QString" value="0,0"/>
                <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
                <Option name="offset_unit" type="QString" value="MM"/>
                <Option name="outline_color" type="QString" value="35,35,35,255"/>
                <Option name="outline_style" type="QString" value="solid"/>
                <Option name="outline_width" type="QString" value="0"/>
                <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
                <Option name="outline_width_unit" type="QString" value="MM"/>
                <Option name="scale_method" type="QString" value="diameter"/>
                <Option name="size" type="QString" value="2"/>
                <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
                <Option name="size_unit" type="QString" value="MM"/>
                <Option name="vertical_anchor_point" type="QString" value="1"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol name="fillSymbol" type="fill" is_animated="0" force_rhr="0" frame_rate="10" alpha="1" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" pass="0" locked="0" enabled="1">
              <Option type="Map">
                <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
                <Option name="color" type="QString" value="255,255,255,255"/>
                <Option name="joinstyle" type="QString" value="bevel"/>
                <Option name="offset" type="QString" value="0,0"/>
                <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
                <Option name="offset_unit" type="QString" value="MM"/>
                <Option name="outline_color" type="QString" value="128,128,128,255"/>
                <Option name="outline_style" type="QString" value="no"/>
                <Option name="outline_width" type="QString" value="0"/>
                <Option name="outline_width_unit" type="QString" value="MM"/>
                <Option name="style" type="QString" value="solid"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetAngle="135" shadowOffsetUnit="MM" shadowRadius="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0" shadowRadiusUnit="MM" shadowScale="100" shadowUnder="0" shadowColor="0,0,0,255" shadowBlendMode="6"/>
        <dd_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" multilineAlign="0" addDirectionSymbol="0" rightDirectionSymbol=">" formatNumbers="0" wrapChar="" plussign="0" placeDirectionSymbol="0" decimals="3" autoWrapLength="0" reverseDirectionSymbol="0"/>
      <placement centroidWhole="0" xOffset="0" rotationUnit="AngleDegrees" overlapHandling="PreventOverlap" preserveRotation="1" distUnits="MM" offsetType="0" yOffset="0" overrunDistance="0" overrunDistanceUnit="MM" geometryGenerator="" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="25" geometryGeneratorType="PointGeometry" repeatDistanceUnits="MM" polygonPlacementFlags="2" lineAnchorPercent="1" distMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" rotationAngle="0" placementFlags="9" geometryGeneratorEnabled="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistance="0" placement="2" quadOffset="4" lineAnchorTextPoint="CenterOfText" maxCurvedCharAngleOut="-25" offsetUnits="MM" allowDegraded="0" dist="0" fitInPolygonOnly="0" lineAnchorClipping="1" lineAnchorType="1" layerType="LineGeometry" priority="5" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0"/>
      <rendering scaleVisibility="1" scaleMin="1" scaleMax="2500" obstacle="0" obstacleFactor="1" fontLimitPixelSize="0" limitNumLabels="0" mergeLines="0" upsidedownLabels="0" drawLabels="1" fontMaxPixelSize="10000" zIndex="0" labelPerPart="0" obstacleType="1" minFeatureSize="0" maxNumLabels="2000" unplacedVisibility="0" fontMinPixelSize="3"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties" type="Map">
            <Option name="Color" type="Map">
              <Option name="active" type="bool" value="true"/>
              <Option name="expression" type="QString" value="CASE &#xd;&#xa;WHEN min(ZD, ZB, ZS) = 0 THEN '#FF0000'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 1 THEN '#FF7F00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 2 THEN '#FFFF00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 3 THEN '#8FCF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 4 THEN '#00AF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 5 THEN '#0000FF'END"/>
              <Option name="type" type="int" value="3"/>
            </Option>
          </Option>
          <Option name="type" type="QString" value="collection"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
          <Option name="blendMode" type="int" value="0"/>
          <Option name="ddProperties" type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
          <Option name="drawToAllParts" type="bool" value="false"/>
          <Option name="enabled" type="QString" value="0"/>
          <Option name="labelAnchorPoint" type="QString" value="point_on_exterior"/>
          <Option name="lineSymbol" type="QString" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; pass=&quot;0&quot; locked=&quot;0&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;capstyle&quot; type=&quot;QString&quot; value=&quot;square&quot;/>&lt;Option name=&quot;customdash&quot; type=&quot;QString&quot; value=&quot;5;2&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;customdash_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;joinstyle&quot; type=&quot;QString&quot; value=&quot;bevel&quot;/>&lt;Option name=&quot;line_color&quot; type=&quot;QString&quot; value=&quot;60,60,60,255&quot;/>&lt;Option name=&quot;line_style&quot; type=&quot;QString&quot; value=&quot;solid&quot;/>&lt;Option name=&quot;line_width&quot; type=&quot;QString&quot; value=&quot;0.3&quot;/>&lt;Option name=&quot;line_width_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;ring_filter&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;trim_distance_start&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;use_custom_dash&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
          <Option name="minLength" type="double" value="0"/>
          <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="minLengthUnit" type="QString" value="MM"/>
          <Option name="offsetFromAnchor" type="double" value="0"/>
          <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
          <Option name="offsetFromLabel" type="double" value="0"/>
          <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <customproperties>
    <Option type="Map">
      <Option name="QFieldSync/action" type="QString" value="copy"/>
      <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
      <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
      <Option name="QFieldSync/geometry_locked_expression" type="QString" value=""/>
      <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
      <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
      <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
      <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
      <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
      <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
      <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
      <Option name="dualview/previewExpressions" type="List">
        <Option type="QString" value="&quot;film_dateiname&quot;"/>
        <Option type="QString" value="&quot;foto_dateiname&quot;"/>
        <Option type="QString" value="&quot;film_dateiname&quot;"/>
      </Option>
      <Option name="embeddedWidgets/count" type="int" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="untersuchhal" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="schoben" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="schunten" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="id" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="untersuchtag" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
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
    <field name="station" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="stationtext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="timecode" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="video_offset" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="charakt1" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="charakt2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="quantnr1" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="quantnr2" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="streckenschaden" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pos_bis" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="foto_dateiname" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
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
    <field name="ordner_bild" configurationFlags="None">
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
            <Option name="allow_null" type="bool" value="true"/>
            <Option name="calendar_popup" type="bool" value="true"/>
            <Option name="display_format" type="QString" value="dd.MM.yyyy HH:mm:ss"/>
            <Option name="field_format" type="QString" value="yyyy-MM-dd HH:mm:ss"/>
            <Option name="field_iso_format" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="untersuchhal"/>
    <alias name="Anfangsschacht" index="2" field="schoben"/>
    <alias name="Endschacht" index="3" field="schunten"/>
    <alias name="Inspektionsnr" index="4" field="id"/>
    <alias name="Inspektionsdatum" index="5" field="untersuchtag"/>
    <alias name="" index="6" field="bandnr"/>
    <alias name="Videozähler" index="7" field="videozaehler"/>
    <alias name="Inspektionslänge" index="8" field="inspektionslaenge"/>
    <alias name="Station" index="9" field="station"/>
    <alias name="Station Text" index="10" field="stationtext"/>
    <alias name="Zeitstempel" index="11" field="timecode"/>
    <alias name="Video Offset" index="12" field="video_offset"/>
    <alias name="" index="13" field="langtext"/>
    <alias name="Kürzel" index="14" field="kuerzel"/>
    <alias name="" index="15" field="charakt1"/>
    <alias name="" index="16" field="charakt2"/>
    <alias name="" index="17" field="quantnr1"/>
    <alias name="" index="18" field="quantnr2"/>
    <alias name="Streckenschaden" index="19" field="streckenschaden"/>
    <alias name="Streckenschaden Laufnummer" index="20" field="streckenschaden_lfdnr"/>
    <alias name="Position Anfang" index="21" field="pos_von"/>
    <alias name="Position Ende" index="22" field="pos_bis"/>
    <alias name="Dateiname Foto" index="23" field="foto_dateiname"/>
    <alias name="Dateiname Film" index="24" field="film_dateiname"/>
    <alias name="Ordner Bild" index="25" field="ordner_bild"/>
    <alias name="Ordner Video" index="26" field="ordner_video"/>
    <alias name="" index="27" field="filmtyp"/>
    <alias name="" index="28" field="video_start"/>
    <alias name="" index="29" field="video_ende"/>
    <alias name="" index="30" field="ZD"/>
    <alias name="" index="31" field="ZB"/>
    <alias name="" index="32" field="ZS"/>
    <alias name="" index="33" field="kommentar"/>
    <alias name="bearbeitet" index="34" field="createdat"/>
  </aliases>
  <defaults>
    <default expression="" field="pk" applyOnUpdate="0"/>
    <default expression="" field="untersuchhal" applyOnUpdate="0"/>
    <default expression="" field="schoben" applyOnUpdate="0"/>
    <default expression="" field="schunten" applyOnUpdate="0"/>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="" field="untersuchtag" applyOnUpdate="0"/>
    <default expression="" field="bandnr" applyOnUpdate="0"/>
    <default expression="" field="videozaehler" applyOnUpdate="0"/>
    <default expression="" field="inspektionslaenge" applyOnUpdate="0"/>
    <default expression="" field="station" applyOnUpdate="0"/>
    <default expression="" field="stationtext" applyOnUpdate="0"/>
    <default expression="" field="timecode" applyOnUpdate="0"/>
    <default expression="" field="video_offset" applyOnUpdate="0"/>
    <default expression="" field="langtext" applyOnUpdate="0"/>
    <default expression="" field="kuerzel" applyOnUpdate="0"/>
    <default expression="" field="charakt1" applyOnUpdate="0"/>
    <default expression="" field="charakt2" applyOnUpdate="0"/>
    <default expression="" field="quantnr1" applyOnUpdate="0"/>
    <default expression="" field="quantnr2" applyOnUpdate="0"/>
    <default expression="" field="streckenschaden" applyOnUpdate="0"/>
    <default expression="" field="streckenschaden_lfdnr" applyOnUpdate="0"/>
    <default expression="" field="pos_von" applyOnUpdate="0"/>
    <default expression="" field="pos_bis" applyOnUpdate="0"/>
    <default expression="" field="foto_dateiname" applyOnUpdate="0"/>
    <default expression="" field="film_dateiname" applyOnUpdate="0"/>
    <default expression="" field="ordner_bild" applyOnUpdate="0"/>
    <default expression="" field="ordner_video" applyOnUpdate="0"/>
    <default expression="" field="filmtyp" applyOnUpdate="0"/>
    <default expression="" field="video_start" applyOnUpdate="0"/>
    <default expression="" field="video_ende" applyOnUpdate="0"/>
    <default expression="" field="ZD" applyOnUpdate="0"/>
    <default expression="" field="ZB" applyOnUpdate="0"/>
    <default expression="" field="ZS" applyOnUpdate="0"/>
    <default expression="" field="kommentar" applyOnUpdate="0"/>
    <default expression="" field="createdat" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" unique_strength="1" notnull_strength="1" exp_strength="0" field="pk"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="untersuchhal"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="schoben"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="schunten"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="id"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="untersuchtag"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="bandnr"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="videozaehler"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="inspektionslaenge"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="station"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="stationtext"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="timecode"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="video_offset"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="langtext"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="kuerzel"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="charakt1"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="charakt2"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="quantnr1"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="quantnr2"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="streckenschaden"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="streckenschaden_lfdnr"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="pos_von"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="pos_bis"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="foto_dateiname"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="film_dateiname"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="ordner_bild"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="ordner_video"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="filmtyp"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="video_start"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="video_ende"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="ZD"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="ZB"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="ZS"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="kommentar"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" exp_strength="0" field="createdat"/>
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
    <defaultAction value="{9af77687-1c82-4624-b777-9a1b9d48ecb3}" key="Canvas"/>
    <actionsetting name="Bild öffnen" action="[%ordner_bild %]/[%'Band'+substr(foto_dateiname,0,5)%]/[%foto_dateiname%]" shortTitle="Bild öffnen" notificationMessage="" isEnabledOnlyWhenEditable="0" type="5" icon="" capture="0" id="{bb35f5ca-7e7f-44b7-bfaa-ffea0d960666}">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting name="Video abspielen" action="from qgis.utils import iface&#xd;&#xa;from qgis.core import *&#xd;&#xa;from qgis.gui import QgsMessageBar&#xd;&#xa;import os&#xd;&#xa;&#xd;&#xa;try:&#xd;&#xa;    from qkan.tools.videoplayer import Videoplayer&#xd;&#xa;&#xd;&#xa;    video=r'[%film_dateiname%]'&#xd;&#xa;    video=video.lower()&#xd;&#xa;    #timecode=[% if(&quot;timecode&quot; = NULL,None,&quot;timecode&quot;)%]&#xd;&#xa;    timecode = None&#xd;&#xa;    timecode=[%CASE WHEN &quot;timecode&quot;  IS NULL THEN 0 ELSE &quot;timecode&quot; END%]&#xd;&#xa;    if timecode == 0:&#xd;&#xa;        window = Videoplayer(video=video, time=0)&#xd;&#xa;    else:&#xd;&#xa;        time_h=int(timecode/1000000) if timecode>1000000 else 0&#xd;&#xa;        time_m=(int(timecode/10000) if timecode>10000 else 0 )-(time_h*100)&#xd;&#xa;        time_s=(int(timecode/100) if timecode>100 else 0 )-(time_h*10000)-(time_m*100)&#xd;&#xa;        &#xd;&#xa;        video_offset= [%CASE WHEN &quot;video_offset&quot;  IS NULL THEN 0 ELSE &quot;video_offset&quot; END%]&#xd;&#xa;        time = float(time_h/3600+time_m/60+time_s+video_offset)&#xd;&#xa;        window = Videoplayer(video=video, time=time)&#xd;&#xa;        &#xd;&#xa;    window.show()&#xd;&#xa;    window.open_file()&#xd;&#xa;    window.exec_()&#xd;&#xa;        &#xd;&#xa;except ImportError:&#xd;&#xa;    raise Exception(&#xd;&#xa;        &quot;The QKan main plugin has to be installed for this to work.&quot;&#xd;&#xa;     )" shortTitle="" notificationMessage="" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="0" id="{3a3384dc-9a4e-4d34-909c-74537cee71fa}">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting name="Panoramo" action="[%IF( substr(&quot;film_dateiname&quot;,-3)='ipf',&quot;film_dateiname&quot; , &quot;film_dateiname&quot;)%]" shortTitle="" notificationMessage="" isEnabledOnlyWhenEditable="0" type="5" icon="" capture="0" id="{9af77687-1c82-4624-b777-9a1b9d48ecb3}">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="1" actionWidgetStyle="dropDown" sortExpression="&quot;video_offset&quot;">
    <columns>
      <column name="pk" type="field" hidden="0" width="-1"/>
      <column name="untersuchhal" type="field" hidden="0" width="-1"/>
      <column name="schoben" type="field" hidden="0" width="-1"/>
      <column name="schunten" type="field" hidden="0" width="-1"/>
      <column name="id" type="field" hidden="0" width="-1"/>
      <column name="untersuchtag" type="field" hidden="0" width="-1"/>
      <column name="bandnr" type="field" hidden="0" width="-1"/>
      <column name="videozaehler" type="field" hidden="0" width="-1"/>
      <column name="inspektionslaenge" type="field" hidden="0" width="-1"/>
      <column name="station" type="field" hidden="0" width="-1"/>
      <column name="stationtext" type="field" hidden="0" width="-1"/>
      <column name="timecode" type="field" hidden="0" width="-1"/>
      <column name="video_offset" type="field" hidden="0" width="-1"/>
      <column name="langtext" type="field" hidden="0" width="-1"/>
      <column name="kuerzel" type="field" hidden="0" width="-1"/>
      <column name="charakt1" type="field" hidden="0" width="-1"/>
      <column name="charakt2" type="field" hidden="0" width="-1"/>
      <column name="quantnr1" type="field" hidden="0" width="-1"/>
      <column name="quantnr2" type="field" hidden="0" width="-1"/>
      <column name="streckenschaden" type="field" hidden="0" width="-1"/>
      <column name="streckenschaden_lfdnr" type="field" hidden="0" width="-1"/>
      <column name="pos_von" type="field" hidden="0" width="-1"/>
      <column name="pos_bis" type="field" hidden="0" width="-1"/>
      <column name="foto_dateiname" type="field" hidden="0" width="-1"/>
      <column name="film_dateiname" type="field" hidden="0" width="-1"/>
      <column name="ordner_bild" type="field" hidden="0" width="-1"/>
      <column name="ordner_video" type="field" hidden="0" width="-1"/>
      <column name="filmtyp" type="field" hidden="0" width="-1"/>
      <column name="video_start" type="field" hidden="0" width="-1"/>
      <column name="video_ende" type="field" hidden="0" width="-1"/>
      <column name="ZD" type="field" hidden="0" width="-1"/>
      <column name="ZB" type="field" hidden="0" width="-1"/>
      <column name="ZS" type="field" hidden="0" width="-1"/>
      <column name="kommentar" type="field" hidden="0" width="-1"/>
      <column name="createdat" type="field" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users\hoettges\AppData\Roaming\QGIS\QGIS3\profiles\default\python\plugins\qkan\forms\qkan_untersuchdat_haltung.ui</editform>
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
    <field name="ZB" editable="1"/>
    <field name="ZD" editable="1"/>
    <field name="ZS" editable="1"/>
    <field name="bandnr" editable="1"/>
    <field name="charakt1" editable="1"/>
    <field name="charakt2" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="film_dateiname" editable="1"/>
    <field name="filmtyp" editable="1"/>
    <field name="foto_dateiname" editable="1"/>
    <field name="id" editable="1"/>
    <field name="inspektionslaenge" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="langtext" editable="1"/>
    <field name="ordner_bild" editable="1"/>
    <field name="ordner_video" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="pos_bis" editable="1"/>
    <field name="pos_von" editable="1"/>
    <field name="quantnr1" editable="1"/>
    <field name="quantnr2" editable="1"/>
    <field name="richtung" editable="1"/>
    <field name="schoben" editable="1"/>
    <field name="schunten" editable="1"/>
    <field name="station" editable="1"/>
    <field name="stationtext" editable="1"/>
    <field name="streckenschaden" editable="1"/>
    <field name="streckenschaden_lfdnr" editable="1"/>
    <field name="timecode" editable="1"/>
    <field name="untersuchhal" editable="1"/>
    <field name="untersuchrichtung" editable="1"/>
    <field name="untersuchtag" editable="1"/>
    <field name="video_ende" editable="1"/>
    <field name="video_offset" editable="1"/>
    <field name="video_start" editable="1"/>
    <field name="videozaehler" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="ZB" labelOnTop="0"/>
    <field name="ZD" labelOnTop="0"/>
    <field name="ZS" labelOnTop="0"/>
    <field name="bandnr" labelOnTop="0"/>
    <field name="charakt1" labelOnTop="0"/>
    <field name="charakt2" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="film_dateiname" labelOnTop="0"/>
    <field name="filmtyp" labelOnTop="0"/>
    <field name="foto_dateiname" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="inspektionslaenge" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="kuerzel" labelOnTop="0"/>
    <field name="langtext" labelOnTop="0"/>
    <field name="ordner_bild" labelOnTop="0"/>
    <field name="ordner_video" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="pos_bis" labelOnTop="0"/>
    <field name="pos_von" labelOnTop="0"/>
    <field name="quantnr1" labelOnTop="0"/>
    <field name="quantnr2" labelOnTop="0"/>
    <field name="richtung" labelOnTop="0"/>
    <field name="schoben" labelOnTop="0"/>
    <field name="schunten" labelOnTop="0"/>
    <field name="station" labelOnTop="0"/>
    <field name="stationtext" labelOnTop="0"/>
    <field name="streckenschaden" labelOnTop="0"/>
    <field name="streckenschaden_lfdnr" labelOnTop="0"/>
    <field name="timecode" labelOnTop="0"/>
    <field name="untersuchhal" labelOnTop="0"/>
    <field name="untersuchrichtung" labelOnTop="0"/>
    <field name="untersuchtag" labelOnTop="0"/>
    <field name="video_ende" labelOnTop="0"/>
    <field name="video_offset" labelOnTop="0"/>
    <field name="video_start" labelOnTop="0"/>
    <field name="videozaehler" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="ZB" reuseLastValue="0"/>
    <field name="ZD" reuseLastValue="0"/>
    <field name="ZS" reuseLastValue="0"/>
    <field name="bandnr" reuseLastValue="0"/>
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
    <field name="richtung" reuseLastValue="0"/>
    <field name="schoben" reuseLastValue="0"/>
    <field name="schunten" reuseLastValue="0"/>
    <field name="station" reuseLastValue="0"/>
    <field name="stationtext" reuseLastValue="0"/>
    <field name="streckenschaden" reuseLastValue="0"/>
    <field name="streckenschaden_lfdnr" reuseLastValue="0"/>
    <field name="timecode" reuseLastValue="0"/>
    <field name="untersuchhal" reuseLastValue="0"/>
    <field name="untersuchrichtung" reuseLastValue="0"/>
    <field name="untersuchtag" reuseLastValue="0"/>
    <field name="video_ende" reuseLastValue="0"/>
    <field name="video_offset" reuseLastValue="0"/>
    <field name="video_start" reuseLastValue="0"/>
    <field name="videozaehler" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"film_dateiname"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
