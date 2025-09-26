<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyAlgorithm="0" version="3.34.7-Prizren" minScale="100000000" simplifyDrawingHints="0" readOnly="0" labelsEnabled="0" simplifyMaxScale="1" simplifyLocal="1" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" symbologyReferenceScale="-1" styleCategories="AllStyleCategories">
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
        <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{c4d69b2c-d615-43ba-a620-69718c8a3682}">
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
        <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{cba7e5b6-79d8-4ff8-8063-f9da1d7a6f9c}">
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
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{968a3fcb-c878-4289-a566-c980e273dcc0}">
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="0" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{84f9489c-2ebd-4af3-b97a-7790fdc9aa0a}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,21,21,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="1" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{7e802287-ae35-457a-b44c-4817b0617ba3}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,127,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="2" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{601cf5ee-049d-40a3-8c50-2420f0535917}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,255,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="3" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{235afc84-b6f9-4a21-ae9d-7cc1af039267}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="143,207,79,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="4" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{344df225-efd0-4364-bcdf-1ee2ffc3a828}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,175,79,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="5" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{8606a671-8d88-477e-bd8f-c05a812b3a37}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,127,255,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
      <symbol alpha="1" force_rhr="0" is_animated="0" name="6" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{9d5b6d36-6e01-47d2-8468-bb84c6ceafda}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="203,203,203,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
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
    </symbols>
    <source-symbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="0" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b6672301-0192-4a71-b882-4749be91a834}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,127,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="2" type="QString"/>
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
    </source-symbol>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol alpha="1" force_rhr="0" is_animated="0" name="" frame_rate="10" clip_to_extent="1" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{65522b99-5c5b-4f8f-bd57-9a6d30c93ba9}">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,0,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="2" type="QString"/>
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
        <Option value="schnam + ' (' + untersuchtag + ')'" type="QString"/>
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
          <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{6d9b6775-ef37-483c-ae59-a9baaa7cc3f0}">
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
  <DiagramLayerSettings placement="0" zIndex="0" linePlacementFlags="18" priority="0" dist="0" obstacle="0" showAll="1">
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
    <field configurationFlags="NoFlag" name="schnam">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="NoFlag" name="durchm">
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
    <field configurationFlags="NoFlag" name="bezugspunkt">
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
    <field configurationFlags="NoFlag" name="untersucher">
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
    <field configurationFlags="NoFlag" name="strasse">
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
    <alias field="schnam" name="Name" index="1"/>
    <alias field="durchm" name="Durchmesser" index="2"/>
    <alias field="baujahr" name="Baujahr" index="3"/>
    <alias field="bezugspunkt" name="" index="4"/>
    <alias field="id" name="Inspektionsnr" index="5"/>
    <alias field="untersuchtag" name="Inspektionsdatum" index="6"/>
    <alias field="untersucher" name="durchgeführt von" index="7"/>
    <alias field="wetter" name="Wetter" index="8"/>
    <alias field="strasse" name="" index="9"/>
    <alias field="bewertungsart" name="Bewertungsart" index="10"/>
    <alias field="bewertungstag" name="Bewertungstag" index="11"/>
    <alias field="datenart" name="" index="12"/>
    <alias field="auftragsbezeichnung" name="" index="13"/>
    <alias field="max_ZD" name="" index="14"/>
    <alias field="max_ZB" name="" index="15"/>
    <alias field="max_ZS" name="" index="16"/>
    <alias field="kommentar" name="Kommentar" index="17"/>
    <alias field="createdat" name="bearbeitet" index="18"/>
  </aliases>
  <splitPolicies>
    <policy field="pk" policy="Duplicate"/>
    <policy field="schnam" policy="Duplicate"/>
    <policy field="durchm" policy="Duplicate"/>
    <policy field="baujahr" policy="Duplicate"/>
    <policy field="bezugspunkt" policy="Duplicate"/>
    <policy field="id" policy="Duplicate"/>
    <policy field="untersuchtag" policy="Duplicate"/>
    <policy field="untersucher" policy="Duplicate"/>
    <policy field="wetter" policy="Duplicate"/>
    <policy field="strasse" policy="Duplicate"/>
    <policy field="bewertungsart" policy="Duplicate"/>
    <policy field="bewertungstag" policy="Duplicate"/>
    <policy field="datenart" policy="Duplicate"/>
    <policy field="auftragsbezeichnung" policy="Duplicate"/>
    <policy field="max_ZD" policy="Duplicate"/>
    <policy field="max_ZB" policy="Duplicate"/>
    <policy field="max_ZS" policy="Duplicate"/>
    <policy field="kommentar" policy="Duplicate"/>
    <policy field="createdat" policy="Duplicate"/>
  </splitPolicies>
  <defaults>
    <default field="pk" expression="" applyOnUpdate="0"/>
    <default field="schnam" expression="" applyOnUpdate="0"/>
    <default field="durchm" expression="" applyOnUpdate="0"/>
    <default field="baujahr" expression="" applyOnUpdate="0"/>
    <default field="bezugspunkt" expression="" applyOnUpdate="0"/>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="untersuchtag" expression="" applyOnUpdate="0"/>
    <default field="untersucher" expression="" applyOnUpdate="0"/>
    <default field="wetter" expression="" applyOnUpdate="0"/>
    <default field="strasse" expression="" applyOnUpdate="0"/>
    <default field="bewertungsart" expression="" applyOnUpdate="0"/>
    <default field="bewertungstag" expression="" applyOnUpdate="0"/>
    <default field="datenart" expression="" applyOnUpdate="0"/>
    <default field="auftragsbezeichnung" expression="" applyOnUpdate="0"/>
    <default field="max_ZD" expression="" applyOnUpdate="0"/>
    <default field="max_ZB" expression="" applyOnUpdate="0"/>
    <default field="max_ZS" expression="" applyOnUpdate="0"/>
    <default field="kommentar" expression="" applyOnUpdate="0"/>
    <default field="createdat" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="pk" constraints="3" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="schnam" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="durchm" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="baujahr" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bezugspunkt" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="id" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="untersuchtag" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="untersucher" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="wetter" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="strasse" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bewertungsart" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="bewertungstag" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="datenart" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="auftragsbezeichnung" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZD" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZB" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="max_ZS" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="kommentar" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="createdat" constraints="0" exp_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="pk" desc="" exp=""/>
    <constraint field="schnam" desc="" exp=""/>
    <constraint field="durchm" desc="" exp=""/>
    <constraint field="baujahr" desc="" exp=""/>
    <constraint field="bezugspunkt" desc="" exp=""/>
    <constraint field="id" desc="" exp=""/>
    <constraint field="untersuchtag" desc="" exp=""/>
    <constraint field="untersucher" desc="" exp=""/>
    <constraint field="wetter" desc="" exp=""/>
    <constraint field="strasse" desc="" exp=""/>
    <constraint field="bewertungsart" desc="" exp=""/>
    <constraint field="bewertungstag" desc="" exp=""/>
    <constraint field="datenart" desc="" exp=""/>
    <constraint field="auftragsbezeichnung" desc="" exp=""/>
    <constraint field="max_ZD" desc="" exp=""/>
    <constraint field="max_ZB" desc="" exp=""/>
    <constraint field="max_ZS" desc="" exp=""/>
    <constraint field="kommentar" desc="" exp=""/>
    <constraint field="createdat" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{7f802d16-fd1e-45ac-9683-a33a61fc674b}"/>
    <actionsetting notificationMessage="" name="Aktuelle Zustandsdaten für alle Schächte anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden(id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Aktuelle Zustandsdaten" isEnabledOnlyWhenEditable="0" id="{7f802d16-fd1e-45ac-9683-a33a61fc674b}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Layer"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Aktuelle Zustandsdaten zu Schacht anzeigen" icon="" capture="0" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowSchachtschaeden(schnam = '[%schnam%]', id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Aktuelle Zustandsdaten zu Schacht" isEnabledOnlyWhenEditable="0" id="{4a3a0185-2108-467d-99e9-ceaa5a1af8ad}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Alle Zustandsdaten für alle Schächte anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden()&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Alle Zustandsdaten" isEnabledOnlyWhenEditable="0" id="{ea503012-c406-40af-9578-1bee6456d353}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Layer"/>
    </actionsetting>
    <actionsetting notificationMessage="" name="Zustandsdaten zu Schacht und Untersuchungsdatum anzeigen" icon="" capture="1" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden(schnam = '[%schnam%]', untersuchtag = '[%untersuchtag%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" type="1" shortTitle="Zustandsdaten zu Schacht und Untersuchungsdatum" isEnabledOnlyWhenEditable="0" id="{df45edbe-ca08-43ef-85cf-7e9ae15140b0}">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column name="pk" hidden="0" type="field" width="-1"/>
      <column name="schnam" hidden="0" type="field" width="-1"/>
      <column name="durchm" hidden="0" type="field" width="-1"/>
      <column name="baujahr" hidden="0" type="field" width="-1"/>
      <column name="bezugspunkt" hidden="0" type="field" width="-1"/>
      <column name="id" hidden="0" type="field" width="-1"/>
      <column name="untersuchtag" hidden="0" type="field" width="-1"/>
      <column name="untersucher" hidden="0" type="field" width="-1"/>
      <column name="wetter" hidden="0" type="field" width="-1"/>
      <column name="strasse" hidden="0" type="field" width="-1"/>
      <column name="bewertungsart" hidden="0" type="field" width="-1"/>
      <column name="bewertungstag" hidden="0" type="field" width="-1"/>
      <column name="datenart" hidden="0" type="field" width="-1"/>
      <column name="auftragsbezeichnung" hidden="0" type="field" width="-1"/>
      <column name="max_ZD" hidden="0" type="field" width="-1"/>
      <column name="max_ZB" hidden="0" type="field" width="-1"/>
      <column name="max_ZS" hidden="0" type="field" width="-1"/>
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
  <editform tolerant="1">C:/Users/nb9255e/Desktop/AppData/Roaming/QGIS/QGIS3/profiles/default/python/plugins/qkan/forms/qkan_schaechte_untersucht.ui</editform>
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
    <field editable="1" name="createdat"/>
    <field editable="1" name="datenart"/>
    <field editable="1" name="durchm"/>
    <field editable="1" name="id"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="max_ZB"/>
    <field editable="1" name="max_ZD"/>
    <field editable="1" name="max_ZS"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="schnam"/>
    <field editable="1" name="strasse"/>
    <field editable="0" name="umbennenung — Tabelle1_schnam_1"/>
    <field editable="1" name="untersucher"/>
    <field editable="1" name="untersuchtag"/>
    <field editable="1" name="wetter"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="auftragsbezeichnung"/>
    <field labelOnTop="0" name="baujahr"/>
    <field labelOnTop="0" name="bewertungsart"/>
    <field labelOnTop="0" name="bewertungstag"/>
    <field labelOnTop="0" name="bezugspunkt"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="datenart"/>
    <field labelOnTop="0" name="durchm"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="max_ZB"/>
    <field labelOnTop="0" name="max_ZD"/>
    <field labelOnTop="0" name="max_ZS"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="schnam"/>
    <field labelOnTop="0" name="strasse"/>
    <field labelOnTop="0" name="umbennenung — Tabelle1_schnam_1"/>
    <field labelOnTop="0" name="untersucher"/>
    <field labelOnTop="0" name="untersuchtag"/>
    <field labelOnTop="0" name="wetter"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="auftragsbezeichnung"/>
    <field reuseLastValue="0" name="baujahr"/>
    <field reuseLastValue="0" name="bewertungsart"/>
    <field reuseLastValue="0" name="bewertungstag"/>
    <field reuseLastValue="0" name="bezugspunkt"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="datenart"/>
    <field reuseLastValue="0" name="durchm"/>
    <field reuseLastValue="0" name="id"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="max_ZB"/>
    <field reuseLastValue="0" name="max_ZD"/>
    <field reuseLastValue="0" name="max_ZS"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="schnam"/>
    <field reuseLastValue="0" name="strasse"/>
    <field reuseLastValue="0" name="umbennenung — Tabelle1_schnam_1"/>
    <field reuseLastValue="0" name="untersucher"/>
    <field reuseLastValue="0" name="untersuchtag"/>
    <field reuseLastValue="0" name="wetter"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>schnam + ' (' + untersuchtag + ')'</previewExpression>
  <mapTip enabled="1">[% schnam + ' (' + untersuchtag + ')' %]</mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
