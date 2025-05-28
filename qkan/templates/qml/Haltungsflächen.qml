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
      <symbol clip_to_extent="1" force_rhr="0" is_animated="0" type="fill" frame_rate="10" alpha="1" name="0">
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
            <Option value="116,161,198,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="221,219,80,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.8" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="no" type="QString" name="style"/>
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
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="flnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="haltnam">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="haltnam" type="QString" name="Key"/>
            <Option value="haltungen20161016203756230" type="QString" name="Layer"/>
            <Option value="Haltungen nach Typ" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;haltungen&quot; (geom) sql=haltungstyp IS NULL or haltungstyp = 'Haltung'" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="haltnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="neigkl">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="neigung">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="befgrad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schwerpunktlaufzeit">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="regenschreiber">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="teilgebiet">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="&quot;kommentar&quot;" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="tgnam" type="QString" name="Key"/>
            <Option value="Teilgebiete_786fa926_704f_4cb1_bc67_eb8571f2f6c0" type="QString" name="Layer"/>
            <Option value="Teilgebiete" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=MultiPolygon checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;teilgebiete&quot; (geom)" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="tgnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="abflussparameter">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="&quot;kommentar&quot;" type="QString" name="Description"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="apnam" type="QString" name="Key"/>
            <Option value="Abflussparameter_KP_e16f4a36_8f43_4398_a67c_53cbd2e8d3e9" type="QString" name="Layer"/>
            <Option value="Abflussparameter HE" type="QString" name="LayerName"/>
            <Option value="spatialite" type="QString" name="LayerProviderName"/>
            <Option value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;abflussparameter&quot;" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="UseCompleter"/>
            <Option value="apnam" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
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
    <alias field="flnam" index="1" name="Name"/>
    <alias field="haltnam" index="2" name="Haltung"/>
    <alias field="schnam" index="3" name="Schacht"/>
    <alias field="neigkl" index="4" name="Neigungsklasse"/>
    <alias field="neigung" index="5" name="Neigung"/>
    <alias field="befgrad" index="6" name="Befestigungsgrad"/>
    <alias field="schwerpunktlaufzeit" index="7" name="Schwerpunktlaufzeit"/>
    <alias field="regenschreiber" index="8" name="Regenschreiber"/>
    <alias field="teilgebiet" index="9" name="Teilgebiet"/>
    <alias field="abflussparameter" index="10" name="Abflussparameter"/>
    <alias field="kommentar" index="11" name="Kommentar"/>
    <alias field="createdat" index="12" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="flnam"/>
    <default expression="" applyOnUpdate="0" field="haltnam"/>
    <default expression="" applyOnUpdate="0" field="schnam"/>
    <default expression="" applyOnUpdate="0" field="neigkl"/>
    <default expression="" applyOnUpdate="0" field="neigung"/>
    <default expression="" applyOnUpdate="0" field="befgrad"/>
    <default expression="" applyOnUpdate="0" field="schwerpunktlaufzeit"/>
    <default expression="" applyOnUpdate="0" field="regenschreiber"/>
    <default expression="" applyOnUpdate="0" field="teilgebiet"/>
    <default expression="" applyOnUpdate="0" field="abflussparameter"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="flnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="haltnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schnam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="neigkl" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="neigung" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="befgrad" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="schwerpunktlaufzeit" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="regenschreiber" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="teilgebiet" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="abflussparameter" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="flnam"/>
    <constraint exp="" desc="" field="haltnam"/>
    <constraint exp="" desc="" field="schnam"/>
    <constraint exp="" desc="" field="neigkl"/>
    <constraint exp="" desc="" field="neigung"/>
    <constraint exp="" desc="" field="befgrad"/>
    <constraint exp="" desc="" field="schwerpunktlaufzeit"/>
    <constraint exp="" desc="" field="regenschreiber"/>
    <constraint exp="" desc="" field="teilgebiet"/>
    <constraint exp="" desc="" field="abflussparameter"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="flnam"/>
      <column hidden="0" type="field" width="-1" name="haltnam"/>
      <column hidden="0" type="field" width="-1" name="neigkl"/>
      <column hidden="0" type="field" width="-1" name="regenschreiber"/>
      <column hidden="0" type="field" width="-1" name="teilgebiet"/>
      <column hidden="0" type="field" width="124" name="abflussparameter"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="0" type="field" width="-1" name="schnam"/>
      <column hidden="0" type="field" width="-1" name="neigung"/>
      <column hidden="0" type="field" width="-1" name="befgrad"/>
      <column hidden="0" type="field" width="-1" name="schwerpunktlaufzeit"/>
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
    <field editable="1" name="abflussparameter"/>
    <field editable="1" name="befgrad"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="flnam"/>
    <field editable="1" name="haltnam"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="neigkl"/>
    <field editable="1" name="neigung"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="regenschreiber"/>
    <field editable="1" name="schnam"/>
    <field editable="1" name="schwerpunktlaufzeit"/>
    <field editable="1" name="teilgebiet"/>
  </editable>
  <labelOnTop>
    <field name="abflussparameter" labelOnTop="0"/>
    <field name="befgrad" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="flnam" labelOnTop="0"/>
    <field name="haltnam" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="neigkl" labelOnTop="0"/>
    <field name="neigung" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="regenschreiber" labelOnTop="0"/>
    <field name="schnam" labelOnTop="0"/>
    <field name="schwerpunktlaufzeit" labelOnTop="0"/>
    <field name="teilgebiet" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="abflussparameter"/>
    <field reuseLastValue="0" name="befgrad"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="flnam"/>
    <field reuseLastValue="0" name="haltnam"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="neigkl"/>
    <field reuseLastValue="0" name="neigung"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="regenschreiber"/>
    <field reuseLastValue="0" name="schnam"/>
    <field reuseLastValue="0" name="schwerpunktlaufzeit"/>
    <field reuseLastValue="0" name="teilgebiet"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"flnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
