{{- $tableNamePlural := .Table.Name | plural | titleCase -}}
{{- $varNameSingular := .Table.Name | singular | camelCase}}
// {{$tableNamePlural}}G retrieves all records.
func {{$tableNamePlural}}G(mods ...qm.QueryMod) {{$varNameSingular}}Query {
	return {{$tableNamePlural}}All(boil.GetDB(), mods...)
}

// {{$tableNamePlural}}All retrieves all the records using an executor.
func {{$tableNamePlural}}All(exec boil.Executor, mods ...qm.QueryMod) {{$varNameSingular}}Query {
	mods = append(mods, qm.From("{{.Table.Name | .SchemaTable}}"))
	return {{$varNameSingular}}Query{NewQuery(exec, mods...)}
}
