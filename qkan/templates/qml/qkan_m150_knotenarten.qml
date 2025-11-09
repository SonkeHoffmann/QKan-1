<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|Notes" version="3.28.13-Firenze" minScale="1e+08" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <customproperties>
    <Option type="Map">
      <Option type="List" name="dualview/previewExpressions">
        <Option type="QString" value="&quot;bezext&quot;"/>
      </Option>
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bezext">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bezqkan">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Schacht" name="Schacht"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Auslass" name="Auslass"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Speicher" name="Speicher"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Anschlussschacht" name="Anschlussschacht"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="{2839923C-8B7D-419E-B84B-CA2FE9B80EC7}" name="&lt;NULL>"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Symbol" name="Symbol"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kuerzel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="subject">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="modul">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="dd.MMM.yyyy HH:mm:ss" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd HH:mm:ss" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" name="" index="0"/>
    <alias field="bezext" name="Externe Bezeichnung" index="1"/>
    <alias field="bezqkan" name="Bezeichung" index="2"/>
    <alias field="kuerzel" name="Kürzel" index="3"/>
    <alias field="subject" name="" index="4"/>
    <alias field="modul" name="" index="5"/>
    <alias field="kommentar" name="Kommentar" index="6"/>
    <alias field="createdat" name="erstellt" index="7"/>
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
    <constraint field="pk" exp_strength="0" unique_strength="1" notnull_strength="1" constraints="3"/>
    <constraint field="bezext" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="bezqkan" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="kuerzel" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="subject" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="modul" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="kommentar" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
    <constraint field="createdat" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="pk" exp=""/>
    <constraint desc="" field="bezext" exp=""/>
    <constraint desc="" field="bezqkan" exp=""/>
    <constraint desc="" field="kuerzel" exp=""/>
    <constraint desc="" field="subject" exp=""/>
    <constraint desc="" field="modul" exp=""/>
    <constraint desc="" field="kommentar" exp=""/>
    <constraint desc="" field="createdat" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column type="field" hidden="0" width="-1" name="pk"/>
      <column type="field" hidden="0" width="-1" name="bezext"/>
      <column type="field" hidden="0" width="-1" name="bezqkan"/>
      <column type="field" hidden="0" width="-1" name="kuerzel"/>
      <column type="field" hidden="1" width="-1" name="subject"/>
      <column type="field" hidden="1" width="-1" name="modul"/>
      <column type="field" hidden="0" width="-1" name="kommentar"/>
      <column type="field" hidden="0" width="-1" name="createdat"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">C:\Users/hoettges/AppData/Roaming/QGIS/QGIS3\profiles\default/python/plugins\qkan\forms\qkan_m150_knotenarten.ui</editform>
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
    <field name="bezext" editable="1"/>
    <field name="bezqkan" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="modul" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="subject" editable="1"/>
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
