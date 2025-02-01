<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" readOnly="0" minScale="0" maxScale="0" version="3.22.16-Białowieża">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" enabled="0" fixedDuration="0" startExpression="" endExpression="" mode="0" durationField="" startField="" accumulate="0" endField="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
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
        <Option value="&quot;apnam&quot;" type="QString"/>
      </Option>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="apnam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="anfangsabflussbeiwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="endabflussbeiwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="benetzungsverlust" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="muldenverlust" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="benetzung_startwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mulden_startwert" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rauheit_kst" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pctZero" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bodenklasse" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="bknam" type="QString"/>
            <Option name="Layer" value="bodenklassen20170516122309914" type="QString"/>
            <Option name="LayerName" value="Bodenklassen" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;bodenklassen&quot;" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="bknam" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flaechentyp" configurationFlags="None">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Description" value="" type="QString"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="bezeichnung" type="QString"/>
            <Option name="Layer" value="flaechentypen_ca71f66a_50bb_41cb_86df_8046fae64926" type="QString"/>
            <Option name="LayerName" value="Flächentypen" type="QString"/>
            <Option name="LayerProviderName" value="spatialite" type="QString"/>
            <Option name="LayerSource" value="dbname='itwh.sqlite' table=&quot;flaechentypen&quot;" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="false" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="bezeichnung" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="apnam"/>
    <alias name="Anfangsabflussbeiwert" index="2" field="anfangsabflussbeiwert"/>
    <alias name="Endabflussbeiwert" index="3" field="endabflussbeiwert"/>
    <alias name="Benetzungsverlust" index="4" field="benetzungsverlust"/>
    <alias name="Muldenverlust" index="5" field="muldenverlust"/>
    <alias name="Benetzung Startwert" index="6" field="benetzung_startwert"/>
    <alias name="Mulden Startwert" index="7" field="mulden_startwert"/>
    <alias name="Rauheitsbeiwert" index="8" field="rauheit_kst"/>
    <alias name="" index="9" field="pctZero"/>
    <alias name="Bodenklasse" index="10" field="bodenklasse"/>
    <alias name="Flächentyp" index="11" field="flaechentyp"/>
    <alias name="Kommentar" index="12" field="kommentar"/>
    <alias name="bearbeitet" index="13" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="apnam"/>
    <default applyOnUpdate="0" expression="" field="anfangsabflussbeiwert"/>
    <default applyOnUpdate="0" expression="" field="endabflussbeiwert"/>
    <default applyOnUpdate="0" expression="" field="benetzungsverlust"/>
    <default applyOnUpdate="0" expression="" field="muldenverlust"/>
    <default applyOnUpdate="0" expression="" field="benetzung_startwert"/>
    <default applyOnUpdate="0" expression="" field="mulden_startwert"/>
    <default applyOnUpdate="0" expression="" field="rauheit_kst"/>
    <default applyOnUpdate="0" expression="" field="pctZero"/>
    <default applyOnUpdate="0" expression="" field="bodenklasse"/>
    <default applyOnUpdate="0" expression="" field="flaechentyp"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="apnam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="anfangsabflussbeiwert"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="endabflussbeiwert"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="benetzungsverlust"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="muldenverlust"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="benetzung_startwert"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="mulden_startwert"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="rauheit_kst"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="pctZero"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bodenklasse"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="flaechentyp"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="apnam"/>
    <constraint exp="" desc="" field="anfangsabflussbeiwert"/>
    <constraint exp="" desc="" field="endabflussbeiwert"/>
    <constraint exp="" desc="" field="benetzungsverlust"/>
    <constraint exp="" desc="" field="muldenverlust"/>
    <constraint exp="" desc="" field="benetzung_startwert"/>
    <constraint exp="" desc="" field="mulden_startwert"/>
    <constraint exp="" desc="" field="rauheit_kst"/>
    <constraint exp="" desc="" field="pctZero"/>
    <constraint exp="" desc="" field="bodenklasse"/>
    <constraint exp="" desc="" field="flaechentyp"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="pk" hidden="1" width="-1" type="field"/>
      <column name="apnam" hidden="0" width="127" type="field"/>
      <column name="anfangsabflussbeiwert" hidden="0" width="-1" type="field"/>
      <column name="endabflussbeiwert" hidden="0" width="-1" type="field"/>
      <column name="benetzungsverlust" hidden="0" width="-1" type="field"/>
      <column name="muldenverlust" hidden="0" width="-1" type="field"/>
      <column name="benetzung_startwert" hidden="0" width="-1" type="field"/>
      <column name="mulden_startwert" hidden="0" width="-1" type="field"/>
      <column name="rauheit_kst" hidden="1" width="-1" type="field"/>
      <column name="pctZero" hidden="1" width="-1" type="field"/>
      <column name="bodenklasse" hidden="0" width="-1" type="field"/>
      <column name="flaechentyp" hidden="0" width="-1" type="field"/>
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
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_abflussparameter.ui</editform>
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
    <field name="anfangsabflussbeiwert" editable="1"/>
    <field name="apnam" editable="1"/>
    <field name="benetzung_startwert" editable="1"/>
    <field name="benetzungsverlust" editable="1"/>
    <field name="bodenklasse" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="endabflussbeiwert" editable="1"/>
    <field name="flaechentyp" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="mulden_startwert" editable="1"/>
    <field name="muldenverlust" editable="1"/>
    <field name="pctZero" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="rauheit_kst" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="anfangsabflussbeiwert" labelOnTop="0"/>
    <field name="apnam" labelOnTop="0"/>
    <field name="benetzung_startwert" labelOnTop="0"/>
    <field name="benetzungsverlust" labelOnTop="0"/>
    <field name="bodenklasse" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="endabflussbeiwert" labelOnTop="0"/>
    <field name="flaechentyp" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="mulden_startwert" labelOnTop="0"/>
    <field name="muldenverlust" labelOnTop="0"/>
    <field name="pctZero" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="rauheit_kst" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="anfangsabflussbeiwert" reuseLastValue="0"/>
    <field name="apnam" reuseLastValue="0"/>
    <field name="benetzung_startwert" reuseLastValue="0"/>
    <field name="benetzungsverlust" reuseLastValue="0"/>
    <field name="bodenklasse" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="endabflussbeiwert" reuseLastValue="0"/>
    <field name="flaechentyp" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="mulden_startwert" reuseLastValue="0"/>
    <field name="muldenverlust" reuseLastValue="0"/>
    <field name="pctZero" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="rauheit_kst" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"apnam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
