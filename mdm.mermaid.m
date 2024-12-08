erDiagram
    PERSONA_MAESTRA {
        string persona_id PK "UUID"
        string curp UK
        string rfc UK
        string nombre
        string primer_apellido
        string segundo_apellido
        string correo_institucional
        timestamp ultima_actualizacion
        string origen_sistema "S1|S2|S3|S6"
        boolean activo
        string persona_clave UK "nombre+apellidos+correo"
    }

    DIMENSION_EMPLEO {
        string empleo_id PK
        string persona_id FK
        string nivel_gobierno
        string ambito_publico
        string institucion
        string puesto
        string funcion
        date fecha_inicio
        date fecha_fin
        string tipo_nombramiento
        string sistema_origen "S1|S2"
        boolean activo
    }

    DIMENSION_SANCION {
        string sancion_id PK
        string persona_id FK
        string tipo_falta
        string tipo_sancion 
        date fecha_resolucion
        date fecha_inicial
        date fecha_final
        string autoridad_sancionadora
        string expediente
        string sistema_origen "S3"
    }

    FACT_DECLARACION_PATRIMONIAL {
        string declaracion_id PK
        string persona_id FK
        string empleo_id FK
        decimal total_ingresos_netos
        string moneda
        date fecha_declaracion
        string tipo_declaracion
        string ejercicio_fiscal
        string sistema_origen "S1"
    }

    FACT_CONTRATO {
        string contrato_id PK
        string institucion_id FK
        string persona_id FK
        string tipo_procedimiento
        decimal monto_total
        string moneda
        date fecha_inicio
        date fecha_fin
        string sistema_origen "S6"
    }

    DIM_INSTITUCION {
        string institucion_id PK
        string nombre
        string siglas
        string tipo_institucion
        string orden_gobierno
        string ambito
        boolean activo
    }

    PERSONA_MAESTRA ||--o{ DIMENSION_EMPLEO : "tiene"
    PERSONA_MAESTRA ||--o{ DIMENSION_SANCION : "recibe"
    PERSONA_MAESTRA ||--o{ FACT_DECLARACION_PATRIMONIAL : "presenta"
    PERSONA_MAESTRA ||--o{ FACT_CONTRATO : "participa"
    DIM_INSTITUCION ||--o{ DIMENSION_EMPLEO : "emplea"
    DIM_INSTITUCION ||--o{ FACT_CONTRATO : "contrata"