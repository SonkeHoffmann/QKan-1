<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="1e+08" version="3.28.13-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal durationField="" accumulate="0" enabled="0" durationUnit="min" startExpression="" fixedDuration="0" mode="0" limitMode="0" endExpression="" startField="" endField="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;bezext&quot;"/>
      </Option>
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector" showLabelLegend="0"/>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezqkan" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="subject" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="modul" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MMM.yyyy HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Externe Bezeichnung" index="1" field="bezext"/>
    <alias name="Bezeichung" index="2" field="bezqkan"/>
    <alias name="Kürzel" index="3" field="kuerzel"/>
    <alias name="" index="4" field="subject"/>
    <alias name="" index="5" field="modul"/>
    <alias name="Kommentar" index="6" field="kommentar"/>
    <alias name="erstellt" index="7" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bezext"/>
    <default applyOnUpdate="0" expression="" field="bezqkan"/>
    <default applyOnUpdate="0" expression="" field="kuerzel"/>
    <default applyOnUpdate="0" expression="'import_knotentypen'" field="subject"/>
    <default applyOnUpdate="0" expression="'m150'" field="modul"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression="" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="1" constraints="3" notnull_strength="1" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bezext"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bezqkan"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kuerzel"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="subject"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="modul"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bezext"/>
    <constraint exp="" desc="" field="bezqkan"/>
    <constraint exp="" desc="" field="kuerzel"/>
    <constraint exp="" desc="" field="subject"/>
    <constraint exp="" desc="" field="modul"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="pk" hidden="0"/>
      <column width="-1" type="field" name="bezext" hidden="0"/>
      <column width="162" type="field" name="bezqkan" hidden="0"/>
      <column width="-1" type="field" name="kuerzel" hidden="0"/>
      <column width="192" type="field" name="subject" hidden="0"/>
      <column width="102" type="field" name="modul" hidden="0"/>
      <column width="125" type="field" name="kommentar" hidden="0"/>
      <column width="160" type="field" name="createdat" hidden="0"/>
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
QGIS-Formulare können eine Python-Funktion haben,, die aufgerufen wird, wenn sich das Formular öffnet

Diese Funktion kann verwendet werden um dem Formular Extralogik hinzuzufügen.

Der Name der Funktion wird im Feld "Python Init-Function" angegeben
Ein Beispiel folgt:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field editable="1" name="bezext"/>
    <field editable="1" name="bezqkan"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="kuerzel"/>
    <field editable="1" name="modul"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="subject"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="bezext"/>
    <field labelOnTop="0" name="bezqkan"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="kuerzel"/>
    <field labelOnTop="0" name="modul"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="subject"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bezext" reuseLastValue="0"/>
    <field name="bezqkan" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="kuerzel" reuseLastValue="0"/>
    <field name="modul" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="subject" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezext"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
