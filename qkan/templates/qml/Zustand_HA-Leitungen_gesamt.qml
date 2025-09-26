<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyAlgorithm="0" version="3.34.7-Prizren" minScale="100000000" simplifyDrawingHints="1" readOnly="0" labelsEnabled="0" simplifyMaxScale="1" simplifyLocal="1" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" symbologyReferenceScale="-1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="4" startExpression="to_date(&quot;untersuchtag&quot;)" durationUnit="min" fixedDuration="0" durationField="pk" accumulate="0" enabled="0" endExpression="to_date(&quot;untersuchtag&quot;)" limitMode="0" endField="" startField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation respectLayerSymbol="1" zoffset="0" zscale="1" clamping="Terrain" binding="Centroid" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" extrusion="0" symbology="Line" extrusionEnabled="0">
    <data-defined-properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{3e139102-23ea-4d51-bcd7-c1cee97459aa}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="225,89,137,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.6" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="fill">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{b92b843f-b672-47e6-b0d7-1a640435f0e1}">
          <Option type="Map">
            <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="color" value="225,89,137,255" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="161,64,98,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.2" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="style" value="solid" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
    <profileMarkerSymbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{32ca10d3-fe4d-4d96-8e92-04f2e860b197}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="225,89,137,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="diamond" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="161,64,98,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0.2" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="3" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileMarkerSymbol>
  </elevation>
  <renderer-v2 enableorderby="0" referencescale="-1" type="categorizedSymbol" attr="min(max_ZD, max_ZB, max_ZS)" forceraster="0" symbollevels="0">
    <categories>
      <category uuid="0" render="true" symbol="0" value="0" type="string" label="Zustandsklasse 0, starker Mangel, Gefahr in Verzug"/>
      <category uuid="1" render="true" symbol="1" value="1" type="string" label="Zustandsklasse 1, starker Mangel"/>
      <category uuid="2" render="true" symbol="2" value="2" type="string" label="Zustandsklasse 2, mittlerer Mangel"/>
      <category uuid="3" render="true" symbol="3" value="3" type="string" label="Zustandsklasse 3, leichter Mangel"/>
      <category uuid="4" render="true" symbol="4" value="4" type="string" label="Zustandsklasse 4, geringfügiger Mangel"/>
      <category uuid="5" render="true" symbol="5" value="5" type="string" label="Zustandsklasse 5, kein Mangel"/>
      <category uuid="6" render="true" symbol="6" value="" type="string" label="nicht ermittelt"/>
    </categories>
    <symbols>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="0" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{e0978b5d-9b49-4c74-89ed-136b15761582}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="255,21,21,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="1" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{6e8d1635-2002-4933-8a0e-0c5ff9ca3fe0}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="255,127,0,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="2" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{368ffb69-d5cc-418a-b8bc-24828002252d}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="255,255,0,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="3" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{ca3a6008-863e-4e5d-95c3-9230be374021}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="143,207,79,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="4" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{30594669-2beb-47ce-9138-23756eb416de}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="0,175,79,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="5" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{25ffe20f-c43f-4617-8bb8-bfe45f9aa48b}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="0,127,255,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.5" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="6" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{377f6586-1c95-49c9-8f18-f3c242ad111e}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="203,203,203,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.26" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="0" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{54cdd4d2-f0c9-4fa8-a8bc-627895f53eb7}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="255,127,0,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.26" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{ddf9e4c5-8804-459e-b124-079bbf69bca9}">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="35,35,35,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.26" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <customproperties>
    <Option type="Map">
      <Option name="QFieldSync/action" value="copy" type="QString"/>
      <Option name="QFieldSync/attachment_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/cloud_action" value="offline" type="QString"/>
      <Option name="QFieldSync/geometry_locked_expression" value="" type="QString"/>
      <Option name="QFieldSync/photo_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/relationship_maximum_visible" value="{}" type="QString"/>
      <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" value="30" type="int"/>
      <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" value="1" type="int"/>
      <Option name="QFieldSync/tracking_measurement_type" value="0" type="int"/>
      <Option name="QFieldSync/tracking_time_requirement_interval_seconds" value="30" type="int"/>
      <Option name="QFieldSync/value_map_button_interface_threshold" value="0" type="int"/>
      <Option name="dualview/previewExpressions" type="List">
        <Option value="leitnam + ' (' + untersuchtag + ')'" type="QString"/>
      </Option>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory opacity="1" penColor="#000000" direction="0" spacingUnitScale="3x:0,0,0,0,0,0" showAxis="1" spacing="5" minimumSize="0" sizeType="MM" spacingUnit="MM" minScaleDenominator="0" backgroundColor="#ffffff" width="15" height="15" enabled="0" labelPlacementMethod="XHeight" lineSizeScale="3x:0,0,0,0,0,0" rotationOffset="270" scaleBasedVisibility="0" diagramOrientation="Up" lineSizeType="MM" barWidth="5" sizeScale="3x:0,0,0,0,0,0" maxScaleDenominator="1e+08" penWidth="0" backgroundAlpha="255" penAlpha="255" scaleDependency="Area">
      <fontProperties underline="0" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" strikethrough="0" bold="0" italic="0" style=""/>
      <attribute field="" colorOpacity="1" color="#000000" label=""/>
      <axisSymbol>
        <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="line">
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
          <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{f5cbd856-1c72-404f-9082-a68c8761a339}">
            <Option type="Map">
              <Option name="align_dash_pattern" value="0" type="QString"/>
              <Option name="capstyle" value="square" type="QString"/>
              <Option name="customdash" value="5;2" type="QString"/>
              <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="customdash_unit" value="MM" type="QString"/>
              <Option name="dash_pattern_offset" value="0" type="QString"/>
              <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
              <Option name="draw_inside_polygon" value="0" type="QString"/>
              <Option name="joinstyle" value="bevel" type="QString"/>
              <Option name="line_color" value="35,35,35,255" type="QString"/>
              <Option name="line_style" value="solid" type="QString"/>
              <Option name="line_width" value="0.26" type="QString"/>
              <Option name="line_width_unit" value="MM" type="QString"/>
              <Option name="offset" value="0" type="QString"/>
              <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offset_unit" value="MM" type="QString"/>
              <Option name="ring_filter" value="0" type="QString"/>
              <Option name="trim_distance_end" value="0" type="QString"/>
              <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="trim_distance_end_unit" value="MM" type="QString"/>
              <Option name="trim_distance_start" value="0" type="QString"/>
              <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="trim_distance_start_unit" value="MM" type="QString"/>
              <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
              <Option name="use_custom_dash" value="0" type="QString"/>
              <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            </Option>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="2" zIndex="0" linePlacementFlags="18" priority="0" dist="0" obstacle="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend showLabelLegend="0" type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="NoFlag" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="leitnam">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="bezugspunkt">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="Rohranfang" value="Rohranfang" type="QString"/>
              </Option>
              <Option type="Map">
                <Option name="Gerinnemittelpunkt" value="Gerinnemittelpunkt" type="QString"/>
              </Option>
            </Option>
          </Option>
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
    <field configurationFlags="NoFlag" name="hoehe">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="breite">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="laenge">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="baujahr">
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="untersucher">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="untersuchrichtung">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="wetter">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="bewertungsart">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="bewertungstag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="strasse">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="datenart">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="auftragsbezeichnung">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="max_ZD">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="max_ZB">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="max_ZS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="xschob">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="yschob">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="xschun">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="yschun">
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
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="dd.MM.yyyy HH:mm:ss" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd HH:mm:ss" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" name="" index="0"/>
    <alias field="leitnam" name="" index="1"/>
    <alias field="bezugspunkt" name="Bezugspunkt" index="2"/>
    <alias field="schoben" name="Anfangsschacht" index="3"/>
    <alias field="schunten" name="Endschacht" index="4"/>
    <alias field="hoehe" name="Profilhöhe" index="5"/>
    <alias field="breite" name="Profilbreite" index="6"/>
    <alias field="laenge" name="Haltungslänge" index="7"/>
    <alias field="baujahr" name="Baujahr" index="8"/>
    <alias field="id" name="Inspektionsnr" index="9"/>
    <alias field="untersuchtag" name="Inspektionsdatum" index="10"/>
    <alias field="untersucher" name="durchgeführt vom" index="11"/>
    <alias field="untersuchrichtung" name="" index="12"/>
    <alias field="wetter" name="Wetter" index="13"/>
    <alias field="bewertungsart" name="Bewertungsart" index="14"/>
    <alias field="bewertungstag" name="Bewertungstag" index="15"/>
    <alias field="strasse" name="" index="16"/>
    <alias field="datenart" name="" index="17"/>
    <alias field="auftragsbezeichnung" name="" index="18"/>
    <alias field="max_ZD" name="" index="19"/>
    <alias field="max_ZB" name="" index="20"/>
    <alias field="max_ZS" name="" index="21"/>
    <alias field="xschob" name="" index="22"/>
    <alias field="yschob" name="" index="23"/>
    <alias field="xschun" name="" index="24"/>
    <alias field="yschun" name="" index="25"/>
    <alias field="kommentar" name="Kommentar" index="26"/>
    <alias field="createdat" name="bearbeitet" index="27"/>
  </aliases>
  <splitPolicies>
    <policy field="pk" policy="Duplicate"/>
    <policy field="leitnam" policy="Duplicate"/>
    <policy field="bezugspunkt" policy="Duplicate"/>
    <policy field="schoben" policy="Duplicate"/>
    <policy field="schunten" policy="Duplicate"/>
    <policy field="hoehe" policy="Duplicate"/>
    <policy field="breite" policy="Duplicate"/>
    <policy field="laenge" policy="Duplicate"/>
    <policy field="baujahr" policy="Duplicate"/>
    <policy field="id" policy="Duplicate"/>
    <policy field="untersuchtag" policy="Duplicate"/>
    <policy field="untersucher" policy="Duplicate"/>
    <policy field="untersuchrichtung" policy="Duplicate"/>
    <policy field="wetter" policy="Duplicate"/>
    <policy field="bewertungsart" policy="Duplicate"/>
    <policy field="bewertungstag" policy="Duplicate"/>
    <policy field="strasse" policy="Duplicate"/>
    <policy field="datenart" policy="Duplicate"/>
    <policy field="auftragsbezeichnung" policy="Duplicate"/>
    <policy field="max_ZD" policy="Duplicate"/>
    <policy field="max_ZB" policy="Duplicate"/>
    <policy field="max_ZS" policy="Duplicate"/>
    <policy field="xschob" policy="Duplicate"/>
    <policy field="yschob" policy="Duplicate"/>
    <policy field="xschun" policy="Duplicate"/>
    <policy field="yschun" policy="Duplicate"/>
    <policy field="kommentar" policy="Duplicate"/>
    <policy field="createdat" policy="Duplicate"/>
  </splitPolicies>
  <defaults>
    <default field="pk" expression="" applyOnUpdate="0"/>
    <default field="leitnam" expression="" applyOnUpdate="0"/>
    <default field="bezugspunkt" expression="" applyOnUpdate="0"/>
    <default field="schoben" expression="" applyOnUpdate="0"/>
    <default field="schunten" expression="" applyOnUpdate="0"/>
    <default field="hoehe" expression="" applyOnUpdate="0"/>
    <default field="breite" expression="" applyOnUpdate="0"/>
    <default field="laenge" expression="" applyOnUpdate="0"/>
    <default field="baujahr" expression="" applyOnUpdate="0"/>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="untersuchtag" expression="" applyOnUpdate="0"/>
    <default field="untersucher" expression="" applyOnUpdate="0"/>
    <default field="untersuchrichtung" expression="" applyOnUpdate="0"/>
    <default field="wetter" expression="" applyOnUpdate="0"/>
    <default field="bewertungsart" expression="" applyOnUpdate="0"/>
    <default field="bewertungstag" expression="" applyOnUpdate="0"/>
    <default field="strasse" expression="" applyOnUpdate="0"/>
    <default field="datenart" expression="" applyOnUpdate="0"/>
    <default field="auftragsbezeichnung" expression="" applyOnUpdate="0"/>
    <default field="max_ZD" expression="" applyOnUpdate="0"/>
    <default field="max_ZB" expression="" applyOnUpdate="0"/>
    <default field="max_ZS" expression="" applyOnUpdate="0"/>
    <default field="xschob" expression="" applyOnUpdate="0"/>
    <default field="yschob" expression="" applyOnUpdate="0"/>
    <default field="xschun" expression="" applyOnUpdate="0"/>
    <default field="yschun" expression="" applyOnUpdate="0"/>
    <default field="kommentar" expression="" applyOnUpdate="0"/>
    <default field="createdat" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="pk" constraints="3" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="leitnam" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bezugspunkt" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="schoben" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="schunten" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="hoehe" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="breite" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="laenge" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="baujahr" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="id" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="untersuchtag" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="untersucher" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="untersuchrichtung" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="wetter" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bewertungsart" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bewertungstag" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="strasse" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="datenart" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="auftragsbezeichnung" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZD" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZB" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZS" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="xschob" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="yschob" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="xschun" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="yschun" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="kommentar" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="createdat" constraints="0" exp_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="pk" desc="" exp=""/>
    <constraint field="leitnam" desc="" exp=""/>
    <constraint field="bezugspunkt" desc="" exp=""/>
    <constraint field="schoben" desc="" exp=""/>
    <constraint field="schunten" desc="" exp=""/>
    <constraint field="hoehe" desc="" exp=""/>
    <constraint field="breite" desc="" exp=""/>
    <constraint field="laenge" desc="" exp=""/>
    <constraint field="baujahr" desc="" exp=""/>
    <constraint field="id" desc="" exp=""/>
    <constraint field="untersuchtag" desc="" exp=""/>
    <constraint field="untersucher" desc="" exp=""/>
    <constraint field="untersuchrichtung" desc="" exp=""/>
    <constraint field="wetter" desc="" exp=""/>
    <constraint field="bewertungsart" desc="" exp=""/>
    <constraint field="bewertungstag" desc="" exp=""/>
    <constraint field="strasse" desc="" exp=""/>
    <constraint field="datenart" desc="" exp=""/>
    <constraint field="auftragsbezeichnung" desc="" exp=""/>
    <constraint field="max_ZD" desc="" exp=""/>
    <constraint field="max_ZB" desc="" exp=""/>
    <constraint field="max_ZS" desc="" exp=""/>
    <constraint field="xschob" desc="" exp=""/>
    <constraint field="yschob" desc="" exp=""/>
    <constraint field="xschun" desc="" exp=""/>
    <constraint field="yschun" desc="" exp=""/>
    <constraint field="kommentar" desc="" exp=""/>
    <constraint field="createdat" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{7f802d16-fd1e-45ac-9683-a33a61fc674b}"/>
    <actionsetting notificationMessage="" name="Aktuelle Zustandsdaten für alle Hausanschlussleitungen anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowHausanschlussschaeden&#xd;&#xa;&#xd;&#xa;form = ShowHausanschlussschaeden(id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Aktuelle Zustandsdaten" isEnabledOnlyWhenEditable="0" id="{7f802d16-fd1e-45ac-9683-a33a61fc674b}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Layer"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Aktuelle Zustandsdaten zu Hausanschlussleitung anzeigen" icon="" capture="0" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowHausanschlussschaeden(untersuchleit = '[%leitnam%]', id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Aktuelle Zustandsdaten zu Hausanschlussleitung" isEnabledOnlyWhenEditable="0" id="{33764888-a85a-479d-961f-e1e8dc370402}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Alle Zustandsdaten für alle Hausanschlussleitungen anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowHausanschlussschaeden&#xd;&#xa;&#xd;&#xa;form = ShowHausanschlussschaeden()&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Alle Zustandsdaten" isEnabledOnlyWhenEditable="0" id="{f0ac47bb-207a-48d1-8d1d-b983bc11a172}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Layer"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Zustandsdaten zu Hausanschlussleitung und Untersuchungsdatum anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowHausanschlussschaeden&#xd;&#xa;&#xd;&#xa;form = ShowHausanschlussschaeden(untersuchleit = '[%leitnam%]', untersuchtag = '[%untersuchtag%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;&#xd;&#xa;" type="1" shortTitle="Zustandsdaten zu Hausanschlussleitung und Untersuchungsdatum" isEnabledOnlyWhenEditable="0" id="{df45edbe-ca08-43ef-85cf-7e9ae15140b0}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;haltnam&quot;" actionWidgetStyle="dropDown" sortOrder="1">
    <columns>
      <column name="pk" hidden="0" type="field" width="-1"/>
      <column name="leitnam" hidden="0" type="field" width="-1"/>
      <column name="bezugspunkt" hidden="0" type="field" width="-1"/>
      <column name="schoben" hidden="0" type="field" width="-1"/>
      <column name="schunten" hidden="0" type="field" width="-1"/>
      <column name="hoehe" hidden="0" type="field" width="-1"/>
      <column name="breite" hidden="0" type="field" width="-1"/>
      <column name="laenge" hidden="0" type="field" width="-1"/>
      <column name="baujahr" hidden="0" type="field" width="-1"/>
      <column name="id" hidden="0" type="field" width="-1"/>
      <column name="untersuchtag" hidden="0" type="field" width="-1"/>
      <column name="untersucher" hidden="0" type="field" width="-1"/>
      <column name="untersuchrichtung" hidden="0" type="field" width="-1"/>
      <column name="wetter" hidden="0" type="field" width="-1"/>
      <column name="bewertungsart" hidden="0" type="field" width="-1"/>
      <column name="bewertungstag" hidden="0" type="field" width="-1"/>
      <column name="strasse" hidden="0" type="field" width="-1"/>
      <column name="datenart" hidden="0" type="field" width="-1"/>
      <column name="auftragsbezeichnung" hidden="0" type="field" width="-1"/>
      <column name="max_ZD" hidden="0" type="field" width="-1"/>
      <column name="max_ZB" hidden="0" type="field" width="-1"/>
      <column name="max_ZS" hidden="0" type="field" width="-1"/>
      <column name="xschob" hidden="0" type="field" width="-1"/>
      <column name="yschob" hidden="0" type="field" width="-1"/>
      <column name="xschun" hidden="0" type="field" width="-1"/>
      <column name="yschun" hidden="0" type="field" width="-1"/>
      <column name="kommentar" hidden="0" type="field" width="-1"/>
      <column name="createdat" hidden="0" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:/Users/nb9255e/Desktop/Users/hoettges/AppData/Roaming/QGIS/QGIS3/profiles/default/python/plugins/qkan/forms/qkan_hausanschluesse_untersucht.ui</editform>
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
    <field editable="1" name="leitnam"/>
    <field editable="1" name="max_ZB"/>
    <field editable="1" name="max_ZD"/>
    <field editable="1" name="max_ZS"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="schoben"/>
    <field editable="1" name="schunten"/>
    <field editable="1" name="strasse"/>
    <field editable="0" name="umbenennung_leitung — Tabelle3_Field4"/>
    <field editable="0" name="umbennenung — Tabelle1_schnam_1"/>
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
    <field labelOnTop="0" name="auftragsbezeichnung"/>
    <field labelOnTop="0" name="baujahr"/>
    <field labelOnTop="0" name="bewertungsart"/>
    <field labelOnTop="0" name="bewertungstag"/>
    <field labelOnTop="0" name="bezugspunkt"/>
    <field labelOnTop="0" name="breite"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="datenart"/>
    <field labelOnTop="0" name="haltnam"/>
    <field labelOnTop="0" name="hoehe"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="laenge"/>
    <field labelOnTop="0" name="leitnam"/>
    <field labelOnTop="0" name="max_ZB"/>
    <field labelOnTop="0" name="max_ZD"/>
    <field labelOnTop="0" name="max_ZS"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="schoben"/>
    <field labelOnTop="0" name="schunten"/>
    <field labelOnTop="0" name="strasse"/>
    <field labelOnTop="0" name="umbenennung_leitung — Tabelle3_Field4"/>
    <field labelOnTop="0" name="umbennenung — Tabelle1_schnam_1"/>
    <field labelOnTop="0" name="untersucher"/>
    <field labelOnTop="0" name="untersuchrichtung"/>
    <field labelOnTop="0" name="untersuchtag"/>
    <field labelOnTop="0" name="wetter"/>
    <field labelOnTop="0" name="xschob"/>
    <field labelOnTop="0" name="xschun"/>
    <field labelOnTop="0" name="yschob"/>
    <field labelOnTop="0" name="yschun"/>
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
    <field reuseLastValue="0" name="leitnam"/>
    <field reuseLastValue="0" name="max_ZB"/>
    <field reuseLastValue="0" name="max_ZD"/>
    <field reuseLastValue="0" name="max_ZS"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="schoben"/>
    <field reuseLastValue="0" name="schunten"/>
    <field reuseLastValue="0" name="strasse"/>
    <field reuseLastValue="0" name="umbenennung_leitung — Tabelle3_Field4"/>
    <field reuseLastValue="0" name="umbennenung — Tabelle1_schnam_1"/>
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
  <previewExpression>leitnam + ' (' + untersuchtag + ')'</previewExpression>
  <mapTip enabled="1">[% leitnam + ' (' + untersuchtag + ')' %]</mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
