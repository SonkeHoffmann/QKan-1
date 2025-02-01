<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0" minScale="100000000" symbologyReferenceScale="-1" maxScale="0" simplifyDrawingHints="0" simplifyLocal="1" version="3.22.16-Białowieża" simplifyMaxScale="1" simplifyDrawingTol="1" labelsEnabled="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" enabled="0" fixedDuration="0" startExpression="to_date(&quot;untersuchtag&quot;)" endExpression="to_date(&quot;untersuchtag&quot;)" mode="4" durationField="" startField="" accumulate="0" endField="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 symbollevels="0" referencescale="-1" attr="min(max_ZD, max_ZB, max_ZS)" forceraster="0" type="categorizedSymbol" enableorderby="0">
    <categories>
      <category symbol="0" render="true" value="0" label="Zustandsklasse 0, starker Mangel, Gefahr in Verzug"/>
      <category symbol="1" render="true" value="1" label="Zustandsklasse 1, starker Mangel"/>
      <category symbol="2" render="true" value="2" label="Zustandsklasse 2, mittlerer Mangel"/>
      <category symbol="3" render="true" value="3" label="Zustandsklasse 3, leichter Mangel"/>
      <category symbol="4" render="true" value="4" label="Zustandsklasse 4, geringfügiger Mangel"/>
      <category symbol="5" render="true" value="5" label="Zustandsklasse 5, kein Mangel"/>
      <category symbol="6" render="true" value="" label="sonstiges"/>
    </categories>
    <symbols>
      <symbol force_rhr="0" name="0" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,21,21,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="255,21,21,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="1" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,127,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="255,127,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="2" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="255,255,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="255,255,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="3" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="143,207,79,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="143,207,79,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="4" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,175,79,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="0,175,79,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="5" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,127,255,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="0,127,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" name="6" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="203,203,203,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="1" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="RenderMetersInMapUnits" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="203,203,203,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="RenderMetersInMapUnits"/>
          <prop k="vertical_anchor_point" v="1"/>
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
      <symbol force_rhr="0" name="0" type="marker" alpha="1" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
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
          <prop k="angle" v="0"/>
          <prop k="cap_style" v="square"/>
          <prop k="color" v="255,127,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
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
      <Option name="variableNames" type="invalid"/>
      <Option name="variableValues" type="invalid"/>
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
    <field name="schnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="durchm" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="baujahr" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bezugspunkt" configurationFlags="None">
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
    <field name="untersucher" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="wetter" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="strasse" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bewertungsart" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bewertungstag" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="datenart" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="auftragsbezeichnung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="max_ZD" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="max_ZB" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="max_ZS" configurationFlags="None">
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
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="schnam"/>
    <alias name="Durchmesser" index="2" field="durchm"/>
    <alias name="Baujahr" index="3" field="baujahr"/>
    <alias name="" index="4" field="bezugspunkt"/>
    <alias name="Inspektionsnr" index="5" field="id"/>
    <alias name="Inspektionsdatum" index="6" field="untersuchtag"/>
    <alias name="durchgeführt von" index="7" field="untersucher"/>
    <alias name="Wetter" index="8" field="wetter"/>
    <alias name="" index="9" field="strasse"/>
    <alias name="Bewertungsart" index="10" field="bewertungsart"/>
    <alias name="Bewertungstag" index="11" field="bewertungstag"/>
    <alias name="" index="12" field="datenart"/>
    <alias name="" index="13" field="auftragsbezeichnung"/>
    <alias name="" index="14" field="max_ZD"/>
    <alias name="" index="15" field="max_ZB"/>
    <alias name="" index="16" field="max_ZS"/>
    <alias name="Kommentar" index="17" field="kommentar"/>
    <alias name="bearbeitet" index="18" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="schnam"/>
    <default applyOnUpdate="0" expression="" field="durchm"/>
    <default applyOnUpdate="0" expression="" field="baujahr"/>
    <default applyOnUpdate="0" expression="" field="bezugspunkt"/>
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="" field="untersuchtag"/>
    <default applyOnUpdate="0" expression="" field="untersucher"/>
    <default applyOnUpdate="0" expression="" field="wetter"/>
    <default applyOnUpdate="0" expression="" field="strasse"/>
    <default applyOnUpdate="0" expression="" field="bewertungsart"/>
    <default applyOnUpdate="0" expression="" field="bewertungstag"/>
    <default applyOnUpdate="0" expression="" field="datenart"/>
    <default applyOnUpdate="0" expression="" field="auftragsbezeichnung"/>
    <default applyOnUpdate="0" expression="" field="max_ZD"/>
    <default applyOnUpdate="0" expression="" field="max_ZB"/>
    <default applyOnUpdate="0" expression="" field="max_ZS"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="schnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="durchm"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="baujahr"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bezugspunkt"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="id"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="untersuchtag"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="untersucher"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="wetter"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="strasse"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bewertungsart"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bewertungstag"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="datenart"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="auftragsbezeichnung"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="max_ZD"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="max_ZB"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="max_ZS"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="schnam"/>
    <constraint exp="" desc="" field="durchm"/>
    <constraint exp="" desc="" field="baujahr"/>
    <constraint exp="" desc="" field="bezugspunkt"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="untersuchtag"/>
    <constraint exp="" desc="" field="untersucher"/>
    <constraint exp="" desc="" field="wetter"/>
    <constraint exp="" desc="" field="strasse"/>
    <constraint exp="" desc="" field="bewertungsart"/>
    <constraint exp="" desc="" field="bewertungstag"/>
    <constraint exp="" desc="" field="datenart"/>
    <constraint exp="" desc="" field="auftragsbezeichnung"/>
    <constraint exp="" desc="" field="max_ZD"/>
    <constraint exp="" desc="" field="max_ZB"/>
    <constraint exp="" desc="" field="max_ZS"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{7f802d16-fd1e-45ac-9683-a33a61fc674b}"/>
    <actionsetting name="Zustandsdaten für alle Schächten anzeigen" capture="1" isEnabledOnlyWhenEditable="0" shortTitle="Alle Zustandsdaten" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden('[%schnam%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" id="{7f802d16-fd1e-45ac-9683-a33a61fc674b}" icon="" type="1" notificationMessage="">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting name="Zustandsdaten für einen Schacht anzeigen" capture="1" isEnabledOnlyWhenEditable="0" shortTitle="" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden('[%schnam%]', '[%untersuchtag%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;" id="{df45edbe-ca08-43ef-85cf-7e9ae15140b0}" icon="" type="1" notificationMessage="">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="pk" hidden="0" width="-1" type="field"/>
      <column name="schnam" hidden="0" width="-1" type="field"/>
      <column name="durchm" hidden="0" width="-1" type="field"/>
      <column name="baujahr" hidden="0" width="-1" type="field"/>
      <column name="bezugspunkt" hidden="0" width="-1" type="field"/>
      <column name="id" hidden="0" width="-1" type="field"/>
      <column name="untersuchtag" hidden="0" width="-1" type="field"/>
      <column name="untersucher" hidden="0" width="-1" type="field"/>
      <column name="wetter" hidden="0" width="-1" type="field"/>
      <column name="strasse" hidden="0" width="-1" type="field"/>
      <column name="bewertungsart" hidden="0" width="-1" type="field"/>
      <column name="bewertungstag" hidden="0" width="-1" type="field"/>
      <column name="datenart" hidden="0" width="-1" type="field"/>
      <column name="auftragsbezeichnung" hidden="0" width="-1" type="field"/>
      <column name="max_ZD" hidden="0" width="-1" type="field"/>
      <column name="max_ZB" hidden="0" width="-1" type="field"/>
      <column name="max_ZS" hidden="0" width="-1" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_schaechte_untersucht.ui</editform>
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
    <field name="auftragsbezeichnung" editable="1"/>
    <field name="baujahr" editable="1"/>
    <field name="bewertungsart" editable="1"/>
    <field name="bewertungstag" editable="1"/>
    <field name="bezugspunkt" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="datenart" editable="1"/>
    <field name="durchm" editable="1"/>
    <field name="id" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="max_ZB" editable="1"/>
    <field name="max_ZD" editable="1"/>
    <field name="max_ZS" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="schnam" editable="1"/>
    <field name="strasse" editable="1"/>
    <field name="untersucher" editable="1"/>
    <field name="untersuchtag" editable="1"/>
    <field name="wetter" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="auftragsbezeichnung" labelOnTop="0"/>
    <field name="baujahr" labelOnTop="0"/>
    <field name="bewertungsart" labelOnTop="0"/>
    <field name="bewertungstag" labelOnTop="0"/>
    <field name="bezugspunkt" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="datenart" labelOnTop="0"/>
    <field name="durchm" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="max_ZB" labelOnTop="0"/>
    <field name="max_ZD" labelOnTop="0"/>
    <field name="max_ZS" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
    <field name="strasse" labelOnTop="0"/>
    <field name="untersucher" labelOnTop="0"/>
    <field name="untersuchtag" labelOnTop="0"/>
    <field name="wetter" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="auftragsbezeichnung" reuseLastValue="0"/>
    <field name="baujahr" reuseLastValue="0"/>
    <field name="bewertungsart" reuseLastValue="0"/>
    <field name="bewertungstag" reuseLastValue="0"/>
    <field name="bezugspunkt" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="datenart" reuseLastValue="0"/>
    <field name="durchm" reuseLastValue="0"/>
    <field name="id" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="max_ZB" reuseLastValue="0"/>
    <field name="max_ZD" reuseLastValue="0"/>
    <field name="max_ZS" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="schnam" reuseLastValue="0"/>
    <field name="strasse" reuseLastValue="0"/>
    <field name="untersucher" reuseLastValue="0"/>
    <field name="untersuchtag" reuseLastValue="0"/>
    <field name="wetter" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>schnam + ' (' + untersuchtag + ')'</previewExpression>
  <mapTip>[% schnam + ' (' + untersuchtag + ')' %]</mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
