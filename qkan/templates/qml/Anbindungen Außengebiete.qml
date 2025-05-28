<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" simplifyAlgorithm="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" symbologyReferenceScale="-1" simplifyDrawingTol="1" minScale="0" simplifyLocal="1" labelsEnabled="0" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="" fixedDuration="0" mode="0" limitMode="0" durationField="" enabled="0" durationUnit="min" startExpression="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 symbollevels="0" referencescale="-1" forceraster="0" enableorderby="0" type="singleSymbol">
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
            <Option value="190,207,80,255" type="QString" name="line_color"/>
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="gebnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schnam">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="schnam" type="QString" name="Key"/>
            <Option value="Geometrien_53c691ed_4408_4aea_a1e3_95482f944a0b" type="QString" name="Layer"/>
            <Option value="Geometrien" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='C:/Users/hoettges/Documents/juelich' host=qkan-public.gbd-websuite.de port=5432 user='isce' key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;schaechte&quot; (geom)" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="schnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="gebnam" index="1" name="Name"/>
    <alias field="schnam" index="2" name="Schacht"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="gebnam"/>
    <default expression="" applyOnUpdate="0" field="schnam"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="gebnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schnam" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="gebnam"/>
    <constraint exp="" desc="" field="schnam"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="gebnam"/>
      <column hidden="0" type="field" width="-1" name="schnam"/>
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
    <field editable="1" name="gebnam"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="schnam"/>
  </editable>
  <labelOnTop>
    <field name="gebnam" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="gebnam"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="schnam"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"gebnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
