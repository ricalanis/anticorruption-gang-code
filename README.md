# Anti-corruption Data Structure, Pipeline and Visualization

This repository contains a data processing and analysis pipeline designed to detect potential corruption cases in public contracting processes using Mexico's National Digital Platform (PDN) data. The project includes both data transformation pipelines and anomaly detection algorithms.

## Project Overview

The pipeline processes raw declaration data from various government systems and transforms it into a structured star schema database, enabling:

- Data standardization and cleaning
- Entity resolution and deduplication
- Relationship mapping between public servants, contracts, and institutions  
- Anomaly detection for potential corruption cases
- Visualization of suspicious patterns and relationships

## Data Pipeline Components

### 0. Data Governance Framework for the National Digital Platform

This framework establishes a comprehensive data governance approach based on DAMA (Data Management Association) principles, specifically designed for Mexico's PDN anti-corruption platform.

#### Core Components
* **Master Data Management (MDM)**: Centralized entity registry and standardization
* **Data Quality Framework**: Rules and metrics for data validation
* **Integration Architecture**: Standards for cross-system data exchange
* **Monitoring System**: Continuous quality assessment and alerting

#### Key Features
* Entity deduplication and standardization
* Cross-system validation rules
* Data quality metrics and monitoring
* Anomaly detection capabilities

#### Implementation Strategy
* Source-level data validation
* Standardized data collection processes
* Entity relationship management
* Privacy-preserving data integration

The framework addresses current data quality challenges while respecting existing system architectures and legal constraints, providing a foundation for improved corruption detection capabilities.

### 1. Data Transformation Pipeline 

The `Pipeline_Crudo_a_entidades_referenciales_v1.ipynb` notebook implements:

- Loading and parsing of raw JSON declaration data
- Transformation into dimensional model with fact and dimension tables:
  - dim_personas: Personal information
  - dim_empleos: Employment details
  - dim_educacion: Educational background
  - fact_declaraciones: Declaration facts and metrics

Key features:
- UUID-based entity identification
- Person deduplication using fuzzy matching
- Referential integrity enforcement
- Export to CSV files for further analysis

### 2. Anomaly Detection

The `Deteccion_Anomalias.ipynb` notebook provides:

- Direct rule-based validation of declarations
- AI/ML-based pattern detection including:
  - TF-IDF vectorization of text fields
  - DBSCAN clustering for outlier detection
  - Network analysis of relationships
- Automated reporting of suspicious cases

### 3. Risk Monitoring Dashboard

The static_fraud_dashboard.html implements a standalone visualization tool that integrates data from both the transformation pipeline and anomaly detection systems.

**Core Features**
* Live monitoring of data quality metrics
* Alert visualization for detected anomalies
* Risk scoring and prioritization display
* Temporal trend analysis and patterns

**Dashboard Components**
* Executive summary with key risk indicators
* Interactive data quality trend charts
* Anomaly distribution visualization
* Priority-based alert system

**Implementation Details**
* Standalone HTML/JavaScript solution
* Chart.js for visualizations
* Tailwind CSS for responsive design
* CDN-based resource loading

⠀The dashboard serves as the visual integration point between data processing and anomaly detection, providing a unified view of anti-corruption monitoring efforts.

## Setup and Usage

### Prerequisites

```python
pip install pandas
pip install numpy 
pip install fuzzywuzzy
pip install scikit-learn
pip install tqdm
```

### Running the Pipeline

1. Place raw JSON declaration files in `/data/raw/`

2. Run the transformation pipeline:
```python
jupyter notebook notebooks/Pipeline_Crudo_a_entidades_referenciales_v1.ipynb
```

3. Execute anomaly detection:
```python
jupyter notebook notebooks/Deteccion_Anomalias.ipynb
```

## Output Files

The pipeline generates several CSV files:
- `dim_personas.csv`: Public servant dimension table
- `dim_empleos.csv`: Employment records
- `dim_educacion.csv`: Educational background
- `fact_declaraciones.csv`: Declaration facts
- `posibles_duplicados.csv`: Potential duplicate person records

## Detection Capabilities

The system can identify potential:
- Conflicts of interest
- Unusual patterns in contracting
- Undeclared relationships
- Asset declaration anomalies
- Suspicious career progressions
- Contract award patterns

## Contributing

Please read the dataton documentation and PDN technical specifications before contributing. Ensure all code follows the existing patterns for data processing and validation.

## License

This project is licensed under Creative Commons Zero (CC BY-NC).

## Acknowledgments

Developed as part of Mexico's Anti-corruption Dataton 2024, organized by the Executive Secretariat of the National Anti-corruption System (SESNA).

## Contributers

* Rocio Rodriguez
* Ricardo Alanis
* Israel Mata

## More content on the project

https://drive.google.com/drive/u/0/folders/13piLcuuGlpcgY00W9-oxaV4oVzLTKUI3

