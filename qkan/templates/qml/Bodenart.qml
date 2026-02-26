<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" minScale="0" version="3.28.13-Firenze" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions|Temporal|Legend|Notes">
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
        <Option type="QString" value="&quot;bknam&quot;"/>
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
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bknam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsrateanfang" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsrateende" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsratestart" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rueckgangskonstante" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regenerationskonstante" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="saettigungswassergehalt" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="QString" name="allow_null" value="1"/>
            <Option type="QString" name="calendar_popup" value="1"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy HH:mm:ss"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd HH:mm:ss"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="bknam"/>
    <alias name="Infilt_rate Max (Anfang)" index="2" field="infiltrationsrateanfang"/>
    <alias name="Infilt_rate Min (Ende)" index="3" field="infiltrationsrateende"/>
    <alias name="Infilt_rate Simulationsstart" index="4" field="infiltrationsratestart"/>
    <alias name="Rückgangskonstante" index="5" field="rueckgangskonstante"/>
    <alias name="Regenerationskonstante" index="6" field="regenerationskonstante"/>
    <alias name="Sättigungswassergehalt" index="7" field="saettigungswassergehalt"/>
    <alias name="Kommentar" index="8" field="kommentar"/>
    <alias name="bearbeitet" index="9" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bknam"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsrateanfang"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsrateende"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsratestart"/>
    <default applyOnUpdate="0" expression="" field="rueckgangskonstante"/>
    <default applyOnUpdate="0" expression="" field="regenerationskonstante"/>
    <default applyOnUpdate="0" expression="" field="saettigungswassergehalt"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="2" constraints="3" notnull_strength="2" field="pk"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="bknam"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="infiltrationsrateanfang"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="infiltrationsrateende"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="infiltrationsratestart"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="rueckgangskonstante"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="regenerationskonstante"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="saettigungswassergehalt"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="kommentar"/>
    <constraint exp_strength="0" unique_strength="0" constraints="0" notnull_strength="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bknam"/>
    <constraint exp="" desc="" field="infiltrationsrateanfang"/>
    <constraint exp="" desc="" field="infiltrationsrateende"/>
    <constraint exp="" desc="" field="infiltrationsratestart"/>
    <constraint exp="" desc="" field="rueckgangskonstante"/>
    <constraint exp="" desc="" field="regenerationskonstante"/>
    <constraint exp="" desc="" field="saettigungswassergehalt"/>
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
      <column width="-1" type="field" name="bknam" hidden="0"/>
      <column width="-1" type="field" name="infiltrationsrateanfang" hidden="0"/>
      <column width="-1" type="field" name="infiltrationsrateende" hidden="0"/>
      <column width="-1" type="field" name="infiltrationsratestart" hidden="0"/>
      <column width="-1" type="field" name="rueckgangskonstante" hidden="0"/>
      <column width="-1" type="field" name="regenerationskonstante" hidden="0"/>
      <column width="-1" type="field" name="saettigungswassergehalt" hidden="0"/>
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
  <attributeEditorForm>
    <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
      <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
    </labelStyle>
    <attributeEditorField name="bknam" index="1" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="infiltrationsrateanfang" index="2" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="infiltrationsrateende" index="3" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="infiltrationsratestart" index="4" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="rueckgangskonstante" index="5" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="regenerationskonstante" index="6" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="saettigungswassergehalt" index="7" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField name="kommentar" index="8" showLabel="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont underline="0" strikethrough="0" style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0"/>
      </labelStyle>
    </attributeEditorField>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="bknam"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="infiltrationsrateanfang"/>
    <field editable="1" name="infiltrationsrateende"/>
    <field editable="1" name="infiltrationsratestart"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="regenerationskonstante"/>
    <field editable="1" name="rueckgangskonstante"/>
    <field editable="1" name="saettigungswassergehalt"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="bknam"/>
    <field labelOnTop="0" name="createdat"/>
    <field labelOnTop="0" name="infiltrationsrateanfang"/>
    <field labelOnTop="0" name="infiltrationsrateende"/>
    <field labelOnTop="0" name="infiltrationsratestart"/>
    <field labelOnTop="0" name="kommentar"/>
    <field labelOnTop="0" name="pk"/>
    <field labelOnTop="0" name="regenerationskonstante"/>
    <field labelOnTop="0" name="rueckgangskonstante"/>
    <field labelOnTop="0" name="saettigungswassergehalt"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bknam" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="infiltrationsrateanfang" reuseLastValue="0"/>
    <field name="infiltrationsrateende" reuseLastValue="0"/>
    <field name="infiltrationsratestart" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="regenerationskonstante" reuseLastValue="0"/>
    <field name="rueckgangskonstante" reuseLastValue="0"/>
    <field name="saettigungswassergehalt" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bknam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
