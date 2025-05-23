<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyDrawingHints="1" simplifyDrawingTol="1" version="3.28.13-Firenze" labelsEnabled="0" symbologyReferenceScale="-1" minScale="0" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" simplifyLocal="1" readOnly="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes">
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
  <renderer-v2 type="singleSymbol" enableorderby="0" symbollevels="0" forceraster="0" referencescale="-1">
    <symbols>
      <symbol type="fill" force_rhr="0" frame_rate="10" is_animated="0" alpha="1" name="0" clip_to_extent="1">
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
            <Option type="QString" name="color" value="116,161,198,255"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="221,219,80,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.8"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="no"/>
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
      <Option type="int" name="embeddedWidgets/count" value="0"/>
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
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="flnam">
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
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value=""/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="haltnam"/>
            <Option type="QString" name="Layer" value="haltungen20161016203756230"/>
            <Option type="QString" name="LayerName" value="Haltungen nach Typ"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;haltungen&quot; (geom) sql=haltungstyp IS NULL or haltungstyp = 'Haltung'"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="haltnam"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schnam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="neigkl">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="neigung">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="befgrad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="schwerpunktlaufzeit">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="regenschreiber">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
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
            <Option type="QString" name="Description" value="&quot;kommentar&quot;"/>
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
    <field configurationFlags="None" name="abflussparameter">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="Description" value="&quot;kommentar&quot;"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="apnam"/>
            <Option type="QString" name="Layer" value="Abflussparameter_KP_e16f4a36_8f43_4398_a67c_53cbd2e8d3e9"/>
            <Option type="QString" name="LayerName" value="Abflussparameter HE"/>
            <Option type="QString" name="LayerProviderName" value="spatialite"/>
            <Option type="QString" name="LayerSource" value="dbname='juelich' host=qkan-public.gbd-websuite.de port=5432 authcfg=qkan002 key='pk' srid=25832 type=LineString checkPrimaryKeyUnicity='0' table=&quot;qkan&quot;.&quot;abflussparameter&quot;"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="true"/>
            <Option type="QString" name="Value" value="apnam"/>
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
    <alias field="flnam" name="Name" index="1"/>
    <alias field="haltnam" name="Haltung" index="2"/>
    <alias field="schnam" name="Schacht" index="3"/>
    <alias field="neigkl" name="Neigungsklasse" index="4"/>
    <alias field="neigung" name="Neigung" index="5"/>
    <alias field="befgrad" name="Befestigungsgrad" index="6"/>
    <alias field="schwerpunktlaufzeit" name="Schwerpunktlaufzeit" index="7"/>
    <alias field="regenschreiber" name="Regenschreiber" index="8"/>
    <alias field="teilgebiet" name="Teilgebiet" index="9"/>
    <alias field="abflussparameter" name="Abflussparameter" index="10"/>
    <alias field="kommentar" name="Kommentar" index="11"/>
    <alias field="createdat" name="bearbeitet" index="12"/>
  </aliases>
  <defaults>
    <default field="pk" applyOnUpdate="0" expression=""/>
    <default field="flnam" applyOnUpdate="0" expression=""/>
    <default field="haltnam" applyOnUpdate="0" expression=""/>
    <default field="schnam" applyOnUpdate="0" expression=""/>
    <default field="neigkl" applyOnUpdate="0" expression=""/>
    <default field="neigung" applyOnUpdate="0" expression=""/>
    <default field="befgrad" applyOnUpdate="0" expression=""/>
    <default field="schwerpunktlaufzeit" applyOnUpdate="0" expression=""/>
    <default field="regenschreiber" applyOnUpdate="0" expression=""/>
    <default field="teilgebiet" applyOnUpdate="0" expression=""/>
    <default field="abflussparameter" applyOnUpdate="0" expression=""/>
    <default field="kommentar" applyOnUpdate="0" expression=""/>
    <default field="createdat" applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')"/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="pk" unique_strength="2" notnull_strength="2" exp_strength="0"/>
    <constraint constraints="0" field="flnam" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="haltnam" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="schnam" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="neigkl" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="neigung" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="befgrad" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="schwerpunktlaufzeit" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="regenschreiber" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="teilgebiet" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="abflussparameter" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="kommentar" unique_strength="0" notnull_strength="0" exp_strength="0"/>
    <constraint constraints="0" field="createdat" unique_strength="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="pk" exp=""/>
    <constraint desc="" field="flnam" exp=""/>
    <constraint desc="" field="haltnam" exp=""/>
    <constraint desc="" field="schnam" exp=""/>
    <constraint desc="" field="neigkl" exp=""/>
    <constraint desc="" field="neigung" exp=""/>
    <constraint desc="" field="befgrad" exp=""/>
    <constraint desc="" field="schwerpunktlaufzeit" exp=""/>
    <constraint desc="" field="regenschreiber" exp=""/>
    <constraint desc="" field="teilgebiet" exp=""/>
    <constraint desc="" field="abflussparameter" exp=""/>
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
      <column type="field" width="-1" name="flnam" hidden="0"/>
      <column type="field" width="-1" name="haltnam" hidden="0"/>
      <column type="field" width="-1" name="neigkl" hidden="0"/>
      <column type="field" width="-1" name="regenschreiber" hidden="0"/>
      <column type="field" width="-1" name="teilgebiet" hidden="0"/>
      <column type="field" width="124" name="abflussparameter" hidden="0"/>
      <column type="field" width="-1" name="kommentar" hidden="0"/>
      <column type="field" width="-1" name="createdat" hidden="0"/>
      <column type="field" width="-1" name="schnam" hidden="0"/>
      <column type="field" width="-1" name="neigung" hidden="0"/>
      <column type="field" width="-1" name="befgrad" hidden="0"/>
      <column type="field" width="-1" name="schwerpunktlaufzeit" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_tezg.ui</editform>
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
    <field labelOnTop="0" name="abflussparameter"/>
    <field labelOnTop="0" name="befgrad"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="flnam"/>
    <field labelOnTop="0" name="haltnam"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="neigkl"/>
    <field labelOnTop="0" name="neigung"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="regenschreiber"/>
    <field labelOnTop="0" name="schnam"/>
    <field labelOnTop="0" name="schwerpunktlaufzeit"/>
    <field labelOnTop="0" name="teilgebiet"/>
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
