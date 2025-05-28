<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" simplifyAlgorithm="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="0" symbologyReferenceScale="-1" simplifyDrawingTol="1" minScale="100000000" simplifyLocal="1" labelsEnabled="1" version="3.28.15-Firenze" readOnly="0">
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
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{4c108ca8-1203-477a-9f48-96d4e381b74c}">
      <rule key="{14f6fa52-828b-4173-9779-a734185c7d50}" symbol="0" filter="min(ZD, ZB, ZS) = 0" label="Zustandsklasse 0, starker Mangel, Gefahr im Verzug"/>
      <rule key="{7d940636-afec-4238-8412-8e5bd6db260b}" symbol="1" filter="min(ZD, ZB, ZS) = 1" label="Zustandsklasse 1, starker Mangel"/>
      <rule key="{9c39bafb-a521-44a9-a29e-0fb200ff73c2}" symbol="2" filter="min(ZD, ZB, ZS) = 2" label="Zustandsklasse 2, mittlerer Mangel"/>
      <rule key="{dbe7c6f4-43a6-47c8-8dd3-f4d395b62016}" symbol="3" filter="min(ZD, ZB, ZS) = 3" label="Zustandsklasse 3, leichter Mangel"/>
      <rule key="{857733ab-acb9-405b-aa85-9270d8a95091}" symbol="4" filter="min(ZD, ZB, ZS) = 4" label="Zustandsklasse 4, geringfügiger Mangel"/>
      <rule key="{a5aced04-09fd-409a-9f4b-ca71ca17d7bd}" symbol="5" filter="min(ZD, ZB, ZS) = 5" label="Zustandsklasse 5, kein Mangel"/>
      <rule key="{06fa0df9-3a60-4a3c-a72c-ca8f10d3ad45}" symbol="6" filter="(min(ZD, ZB, ZS) &lt; 1 OR min(ZD, ZB, ZS) > 5)" label="nicht ermittelt"/>
    </rules>
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
            <Option value="227,26,28,255" type="QString" name="line_color"/>
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
            <Option value="199,199,199,255" type="QString" name="line_color"/>
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
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style multilineHeightUnit="Percentage" useSubstitutions="0" fontItalic="0" forcedBold="0" textOrientation="horizontal" blendMode="0" fontUnderline="0" fontStrikeout="0" fontKerning="1" textOpacity="1" multilineHeight="1" fontFamily="Arial" fontWeight="50" allowHtml="0" legendString="Aa" namedStyle="Standard" fontLetterSpacing="0" fontSizeUnit="RenderMetersInMapUnits" fontSizeMapUnitScale="3x:0,0,0,0,0,0" previewBkgrdColor="255,255,255,255" capitalization="0" fontWordSpacing="0" textColor="0,0,0,255" forcedItalic="0" isExpression="1" fieldName="kuerzel+ ' ' + left(coalesce(charakt1, ' ') + ' ', 1) + ' ' + left(coalesce(charakt2, ' ') + ' ', 1)" fontSize="0.25">
        <families/>
        <text-buffer bufferDraw="0" bufferOpacity="1" bufferNoFill="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferSizeUnits="MM" bufferSize="1" bufferJoinStyle="128"/>
        <text-mask maskSizeUnits="MM" maskJoinStyle="128" maskType="0" maskSize="0.5" maskEnabled="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1" maskedSymbolLayers=""/>
        <background shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0.29999999999999999" shapeRadiiY="0" shapeBorderWidth="0" shapeSizeType="0" shapeOpacity="1" shapeBorderWidthUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeDraw="1" shapeFillColor="255,255,255,255" shapeRadiiUnit="MM" shapeSizeUnit="RenderMetersInMapUnits" shapeOffsetX="0" shapeSizeY="0.01" shapeBlendMode="0" shapeType="0" shapeRadiiX="0" shapeOffsetUnit="MM" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeJoinStyle="64">
          <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="marker" frame_rate="10" alpha="1" name="markerSymbol">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
              <Option type="Map">
                <Option value="0" type="QString" name="angle"/>
                <Option value="square" type="QString" name="cap_style"/>
                <Option value="164,113,88,255" type="QString" name="color"/>
                <Option value="1" type="QString" name="horizontal_anchor_point"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="circle" type="QString" name="name"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="35,35,35,255" type="QString" name="outline_color"/>
                <Option value="solid" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                <Option value="MM" type="QString" name="outline_width_unit"/>
                <Option value="diameter" type="QString" name="scale_method"/>
                <Option value="2" type="QString" name="size"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                <Option value="MM" type="QString" name="size_unit"/>
                <Option value="1" type="QString" name="vertical_anchor_point"/>
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
          <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="fill" frame_rate="10" alpha="1" name="fillSymbol">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" locked="0" class="SimpleFill" enabled="1">
              <Option type="Map">
                <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                <Option value="255,255,255,255" type="QString" name="color"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="0,0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="MM" type="QString" name="offset_unit"/>
                <Option value="128,128,128,255" type="QString" name="outline_color"/>
                <Option value="no" type="QString" name="outline_style"/>
                <Option value="0" type="QString" name="outline_width"/>
                <Option value="MM" type="QString" name="outline_width_unit"/>
                <Option value="solid" type="QString" name="style"/>
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
        </background>
        <shadow shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetDist="1" shadowRadiusAlphaOnly="0" shadowOpacity="0" shadowOffsetAngle="135" shadowDraw="0" shadowScale="100" shadowOffsetGlobal="1" shadowRadius="0" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowColor="0,0,0,255" shadowOffsetUnit="MM"/>
        <dd_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format placeDirectionSymbol="0" addDirectionSymbol="0" multilineAlign="0" leftDirectionSymbol="&lt;" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" rightDirectionSymbol=">" wrapChar="" decimals="3" reverseDirectionSymbol="0" plussign="0" formatNumbers="0"/>
      <placement rotationUnit="AngleDegrees" distMapUnitScale="3x:0,0,0,0,0,0" placementFlags="9" distUnits="MM" placement="2" xOffset="0" priority="5" geometryGenerator="" overrunDistance="0" repeatDistance="0" lineAnchorType="1" preserveRotation="1" overlapHandling="AllowOverlapIfRequired" geometryGeneratorType="PointGeometry" yOffset="0" polygonPlacementFlags="2" centroidWhole="0" layerType="LineGeometry" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceUnits="MM" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" lineAnchorPercent="1" offsetType="0" rotationAngle="0" offsetUnits="MM" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="25" lineAnchorClipping="1" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" centroidInside="0" quadOffset="4" dist="0" allowDegraded="1" lineAnchorTextPoint="CenterOfText" fitInPolygonOnly="0" overrunDistanceUnit="MM" maxCurvedCharAngleOut="-25"/>
      <rendering drawLabels="1" obstacleFactor="1" mergeLines="0" labelPerPart="0" unplacedVisibility="0" scaleVisibility="1" obstacleType="1" scaleMin="1" obstacle="0" fontLimitPixelSize="0" fontMinPixelSize="3" upsidedownLabels="0" maxNumLabels="2000" zIndex="0" scaleMax="2500" limitNumLabels="0" minFeatureSize="0" fontMaxPixelSize="10000"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" type="QString" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Color">
              <Option value="true" type="bool" name="active"/>
              <Option value="CASE &#xd;&#xa;WHEN min(ZD, ZB, ZS) = 0 THEN '#FF0000'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 1 THEN '#FF7F00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 2 THEN '#FFFF00'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 3 THEN '#8FCF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 4 THEN '#00AF4F'&#xd;&#xa;WHEN min(ZD, ZB, ZS) = 5 THEN '#0000FF'END" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
          </Option>
          <Option value="collection" type="QString" name="type"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
          <Option value="0" type="int" name="blendMode"/>
          <Option type="Map" name="ddProperties">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
          <Option value="false" type="bool" name="drawToAllParts"/>
          <Option value="0" type="QString" name="enabled"/>
          <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
          <Option value="&lt;symbol clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; is_animated=&quot;0&quot; type=&quot;line&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
          <Option value="0" type="double" name="minLength"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
          <Option value="MM" type="QString" name="minLengthUnit"/>
          <Option value="0" type="double" name="offsetFromAnchor"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
          <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
          <Option value="0" type="double" name="offsetFromLabel"/>
          <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
          <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
        </Option>
      </callout>
    </settings>
  </labeling>
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
        <Option value="&quot;foto_dateiname&quot;" type="QString"/>
      </Option>
      <Option value="0" type="int" name="embeddedWidgets/count"/>
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
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="untersuchsch">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="untersuchtag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bandnr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="videozaehler">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="timecode">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="langtext">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kuerzel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="charakt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="charakt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="quantnr1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="quantnr2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="streckenschaden">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="streckenschaden_lfdnr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pos_von">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="pos_bis">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="vertikale_lage">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="inspektionslaenge">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bereich">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="foto_dateiname">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ordner_bild">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="film_dateiname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ordner_video">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="filmtyp">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="video_start">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="video_ende">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ZD">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ZB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="ZS">
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
    <alias field="untersuchsch" index="1" name="Name"/>
    <alias field="id" index="2" name="Inspektionsnr"/>
    <alias field="untersuchtag" index="3" name="Inspektionsdatum"/>
    <alias field="bandnr" index="4" name=""/>
    <alias field="videozaehler" index="5" name="Videozähler"/>
    <alias field="timecode" index="6" name="Zeitstempel"/>
    <alias field="langtext" index="7" name=""/>
    <alias field="kuerzel" index="8" name="Kürzel"/>
    <alias field="charakt1" index="9" name=""/>
    <alias field="charakt2" index="10" name=""/>
    <alias field="quantnr1" index="11" name=""/>
    <alias field="quantnr2" index="12" name=""/>
    <alias field="streckenschaden" index="13" name="Streckenschaden"/>
    <alias field="streckenschaden_lfdnr" index="14" name="Streckenschäden Laufnummer"/>
    <alias field="pos_von" index="15" name="Position Anfang"/>
    <alias field="pos_bis" index="16" name="Position Ende"/>
    <alias field="vertikale_lage" index="17" name="Länge vertikal"/>
    <alias field="inspektionslaenge" index="18" name="Inspektionslänge"/>
    <alias field="bereich" index="19" name="Bereich"/>
    <alias field="foto_dateiname" index="20" name="Dateiname Foto"/>
    <alias field="ordner_bild" index="21" name="Ordner Fotos"/>
    <alias field="film_dateiname" index="22" name=""/>
    <alias field="ordner_video" index="23" name=""/>
    <alias field="filmtyp" index="24" name=""/>
    <alias field="video_start" index="25" name=""/>
    <alias field="video_ende" index="26" name=""/>
    <alias field="ZD" index="27" name=""/>
    <alias field="ZB" index="28" name=""/>
    <alias field="ZS" index="29" name=""/>
    <alias field="kommentar" index="30" name=""/>
    <alias field="createdat" index="31" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="untersuchsch"/>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="untersuchtag"/>
    <default expression="" applyOnUpdate="0" field="bandnr"/>
    <default expression="" applyOnUpdate="0" field="videozaehler"/>
    <default expression="" applyOnUpdate="0" field="timecode"/>
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
    <default expression="" applyOnUpdate="0" field="vertikale_lage"/>
    <default expression="" applyOnUpdate="0" field="inspektionslaenge"/>
    <default expression="" applyOnUpdate="0" field="bereich"/>
    <default expression="" applyOnUpdate="0" field="foto_dateiname"/>
    <default expression="" applyOnUpdate="0" field="ordner_bild"/>
    <default expression="" applyOnUpdate="0" field="film_dateiname"/>
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
    <constraint notnull_strength="1" exp_strength="0" field="pk" constraints="3" unique_strength="1"/>
    <constraint notnull_strength="0" exp_strength="0" field="untersuchsch" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="id" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="untersuchtag" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bandnr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="videozaehler" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="timecode" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="langtext" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kuerzel" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="charakt1" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="charakt2" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="quantnr1" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="quantnr2" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="streckenschaden" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="streckenschaden_lfdnr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="pos_von" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="pos_bis" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="vertikale_lage" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="inspektionslaenge" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="bereich" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="foto_dateiname" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ordner_bild" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="film_dateiname" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ordner_video" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="filmtyp" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="video_start" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="video_ende" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ZD" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ZB" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="ZS" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
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
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting id="{bb35f5ca-7e7f-44b7-bfaa-ffea0d960666}" isEnabledOnlyWhenEditable="0" type="5" icon="" capture="0" notificationMessage="" shortTitle="Bild öffnen" action="[%foto_dateiname%]" name="Bild öffnen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting id="{3a3384dc-9a4e-4d34-909c-74537cee71fa}" isEnabledOnlyWhenEditable="0" type="1" icon="" capture="0" notificationMessage="" shortTitle="Video abspielen" action="from qgis.utils import iface&#xa;from qgis.core import *&#xa;from qgis.gui import QgsMessageBar&#xd;&#xa;import os&#xa;&#xa;try:&#xa;    from qkan.tools.videoplayer import Videoplayer&#xa;&#xd;&#xa;    video=r'[%film_dateiname%]'&#xd;&#xa;    video=video.lower()&#xd;&#xa;    #timecode=[% if(&quot;timecode&quot; = NULL,None,&quot;timecode&quot;)%]&#xd;&#xa;    timecode = None&#xd;&#xa;    timecode=[%CASE WHEN &quot;timecode&quot;  IS NULL THEN 0 ELSE &quot;timecode&quot; END%]&#xd;&#xa;    if timecode == 0:&#xd;&#xa;        window = Videoplayer(video=video, time=0)&#xa;    else:&#xd;&#xa;        time_h=int(timecode/1000000) if timecode>1000000 else 0&#xd;&#xa;        time_m=(int(timecode/10000) if timecode>10000 else 0 )-(time_h*100)&#xd;&#xa;        time_s=(int(timecode/100) if timecode>100 else 0 )-(time_h*10000)-(time_m*100)&#xd;&#xa;        &#xd;&#xa;        video_offset= [%CASE WHEN &quot;video_offset&quot;  IS NULL THEN 0 ELSE &quot;video_offset&quot; END%]&#xd;&#xa;        time = float(time_h/3600+time_m/60+time_s+video_offset)&#xd;&#xa;        window = Videoplayer(video=video, time=time)&#xd;&#xa;        &#xd;&#xa;    window.show()&#xa;    window.open_file()&#xa;    window.exec_()&#xa;        &#xa;except ImportError:&#xa;    raise Exception(&#xa;        &quot;The QKan main plugin has to be installed for this to work.&quot;&#xa;     )&#xa;" name="Video abspielen">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="untersuchsch"/>
      <column hidden="0" type="field" width="-1" name="id"/>
      <column hidden="0" type="field" width="-1" name="untersuchtag"/>
      <column hidden="0" type="field" width="-1" name="bandnr"/>
      <column hidden="0" type="field" width="-1" name="videozaehler"/>
      <column hidden="0" type="field" width="-1" name="timecode"/>
      <column hidden="0" type="field" width="-1" name="langtext"/>
      <column hidden="0" type="field" width="-1" name="kuerzel"/>
      <column hidden="0" type="field" width="-1" name="charakt1"/>
      <column hidden="0" type="field" width="-1" name="charakt2"/>
      <column hidden="0" type="field" width="-1" name="quantnr1"/>
      <column hidden="0" type="field" width="-1" name="quantnr2"/>
      <column hidden="0" type="field" width="-1" name="streckenschaden"/>
      <column hidden="0" type="field" width="-1" name="streckenschaden_lfdnr"/>
      <column hidden="0" type="field" width="-1" name="pos_von"/>
      <column hidden="0" type="field" width="-1" name="pos_bis"/>
      <column hidden="0" type="field" width="-1" name="vertikale_lage"/>
      <column hidden="0" type="field" width="-1" name="inspektionslaenge"/>
      <column hidden="0" type="field" width="-1" name="bereich"/>
      <column hidden="0" type="field" width="-1" name="foto_dateiname"/>
      <column hidden="0" type="field" width="-1" name="ordner_bild"/>
      <column hidden="0" type="field" width="-1" name="film_dateiname"/>
      <column hidden="0" type="field" width="-1" name="ordner_video"/>
      <column hidden="0" type="field" width="-1" name="filmtyp"/>
      <column hidden="0" type="field" width="-1" name="video_start"/>
      <column hidden="0" type="field" width="-1" name="video_ende"/>
      <column hidden="0" type="field" width="-1" name="ZD"/>
      <column hidden="0" type="field" width="-1" name="ZB"/>
      <column hidden="0" type="field" width="-1" name="ZS"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
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
    <field name="ZB" labelOnTop="0"/>
    <field name="ZD" labelOnTop="0"/>
    <field name="ZS" labelOnTop="0"/>
    <field name="bandnr" labelOnTop="0"/>
    <field name="bereich" labelOnTop="0"/>
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
    <field name="streckenschaden" labelOnTop="0"/>
    <field name="streckenschaden_lfdnr" labelOnTop="0"/>
    <field name="timecode" labelOnTop="0"/>
    <field name="untersuchsch" labelOnTop="0"/>
    <field name="untersuchtag" labelOnTop="0"/>
    <field name="vertikale_lage" labelOnTop="0"/>
    <field name="video_ende" labelOnTop="0"/>
    <field name="video_start" labelOnTop="0"/>
    <field name="videozaehler" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="ZB"/>
    <field reuseLastValue="0" name="ZD"/>
    <field reuseLastValue="0" name="ZS"/>
    <field reuseLastValue="0" name="bandnr"/>
    <field reuseLastValue="0" name="bereich"/>
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
    <field reuseLastValue="0" name="streckenschaden"/>
    <field reuseLastValue="0" name="streckenschaden_lfdnr"/>
    <field reuseLastValue="0" name="timecode"/>
    <field reuseLastValue="0" name="untersuchsch"/>
    <field reuseLastValue="0" name="untersuchtag"/>
    <field reuseLastValue="0" name="vertikale_lage"/>
    <field reuseLastValue="0" name="video_ende"/>
    <field reuseLastValue="0" name="video_start"/>
    <field reuseLastValue="0" name="videozaehler"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"langtext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
