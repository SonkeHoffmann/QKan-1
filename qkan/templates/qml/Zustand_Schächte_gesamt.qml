<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="100000000" simplifyDrawingHints="0" symbologyReferenceScale="-1" simplifyDrawingTol="1" simplifyLocal="1" labelsEnabled="0" simplifyAlgorithm="0" version="3.28.13-Firenze" simplifyMaxScale="1" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
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
  <renderer-v2 symbollevels="0" forceraster="0" referencescale="-1" type="categorizedSymbol" attr="min(max_ZD, max_ZB, max_ZS)" enableorderby="0">
    <categories>
      <category type="string" label="Zustandsklasse 0, starker Mangel, Gefahr in Verzug" value="0" render="true" symbol="0"/>
      <category type="string" label="Zustandsklasse 1, starker Mangel" value="1" render="true" symbol="1"/>
      <category type="string" label="Zustandsklasse 2, mittlerer Mangel" value="2" render="true" symbol="2"/>
      <category type="string" label="Zustandsklasse 3, leichter Mangel" value="3" render="true" symbol="3"/>
      <category type="string" label="Zustandsklasse 4, geringfügiger Mangel" value="4" render="true" symbol="4"/>
      <category type="string" label="Zustandsklasse 5, kein Mangel" value="5" render="true" symbol="5"/>
      <category type="string" label="nicht ermittelt" value="" render="true" symbol="6"/>
    </categories>
    <symbols>
      <symbol type="marker" clip_to_extent="1" name="0" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="255,21,21,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="1" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="255,127,0,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="2" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="255,255,0,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="3" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="143,207,79,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="4" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="0,175,79,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="5" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="0,127,255,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
      <symbol type="marker" clip_to_extent="1" name="6" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="203,203,203,255"/>
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
            <Option type="QString" name="size" value="1"/>
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
    </symbols>
    <source-symbol>
      <symbol type="marker" clip_to_extent="1" name="0" alpha="1" is_animated="0" force_rhr="0" frame_rate="10">
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
            <Option type="QString" name="color" value="255,127,0,255"/>
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
    </source-symbol>
    <rotation/>
    <sizescale/>
  </renderer-v2>
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
        <Option type="QString" value="schnam + ' (' + untersuchtag + ')'"/>
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
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="bool" name="field_iso_format" value="false"/>
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
    <default applyOnUpdate="0" expression="" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="schnam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="durchm"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="baujahr"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bezugspunkt"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="id"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="untersuchtag"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="untersucher"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="wetter"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="strasse"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bewertungsart"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bewertungstag"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="datenart"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="auftragsbezeichnung"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="max_ZD"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="max_ZB"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="max_ZS"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
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
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Aktuelle Zustandsdaten für alle Schächte anzeigen" shortTitle="Aktuelle Zustandsdaten" id="{7f802d16-fd1e-45ac-9683-a33a61fc674b}" notificationMessage="" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden(id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" capture="1">
      <actionScope id="Layer"/>
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Aktuelle Zustandsdaten zu Schacht anzeigen" shortTitle="Aktuelle Zustandsdaten zu Schacht" id="{4a3a0185-2108-467d-99e9-ceaa5a1af8ad}" notificationMessage="" action="from qkan.tools.zeige_untersuchungsdaten import ShowHaltungsschaeden&#xd;&#xa;form = ShowSchachtschaeden(schnam = '[%schnam%]', id = 1)&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" capture="0">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Alle Zustandsdaten für alle Schächte anzeigen" shortTitle="Alle Zustandsdaten" id="{ea503012-c406-40af-9578-1bee6456d353}" notificationMessage="" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden()&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" capture="1">
      <actionScope id="Layer"/>
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting isEnabledOnlyWhenEditable="0" icon="" type="1" name="Zustandsdaten zu Schacht und Untersuchungsdatum anzeigen" shortTitle="Zustandsdaten zu Schacht und Untersuchungsdatum" id="{df45edbe-ca08-43ef-85cf-7e9ae15140b0}" notificationMessage="" action="from qkan.tools.zeige_untersuchungsdaten import ShowSchachtschaeden&#xd;&#xa;&#xd;&#xa;form = ShowSchachtschaeden(schnam = '[%schnam%]', untersuchtag = '[%untersuchtag%]')&#xd;&#xa;form.show_selected()&#xd;&#xa;del form&#xd;&#xa;" capture="1">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="schnam" hidden="0"/>
      <column width="-1" type="field" name="durchm" hidden="0"/>
      <column width="-1" type="field" name="baujahr" hidden="0"/>
      <column width="-1" type="field" name="bezugspunkt" hidden="0"/>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="untersuchtag" hidden="0"/>
      <column width="-1" type="field" name="untersucher" hidden="0"/>
      <column width="-1" type="field" name="wetter" hidden="0"/>
      <column width="-1" type="field" name="strasse" hidden="0"/>
      <column width="-1" type="field" name="bewertungsart" hidden="0"/>
      <column width="-1" type="field" name="bewertungstag" hidden="0"/>
      <column width="-1" type="field" name="datenart" hidden="0"/>
      <column width="-1" type="field" name="auftragsbezeichnung" hidden="0"/>
      <column width="-1" type="field" name="max_ZD" hidden="0"/>
      <column width="-1" type="field" name="max_ZB" hidden="0"/>
      <column width="-1" type="field" name="max_ZS" hidden="0"/>
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
    <field name="umbennenung — Tabelle1_schnam_1" reuseLastValue="0"/>
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
