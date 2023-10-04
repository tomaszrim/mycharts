{{- if . -}}
#### Container: {{ escapeXML ( index . 0 ).Target }}
    {{ range . }}

**{{ escapeXML .Type }}**

      {{ if (eq (len .Vulnerabilities) 0) }}
| No Vulnerabilities found         |
|:---------------------------------|

      {{ else }}
| Package         |    Vulnerability   |   Severity  |  Installed Version | Fixed Version |
|:----------------|:------------------:|:-----------:|:------------------:|:-------------:|
        {{- range .Vulnerabilities }}
| {{ escapeXML .PkgName }}         |    {{ escapeXML .VulnerabilityID }}   |   {{ escapeXML .Vulnerability.Severity }}  |  {{ escapeXML .InstalledVersion }} | {{ escapeXML .FixedVersion }} |
        {{- end }}
      {{- end }}
    {{- end }}
{{- else }}

| No Vulnerabilities found         |
|:---------------------------------|
{{- end }}
