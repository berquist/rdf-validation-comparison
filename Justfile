ex161:
    hatch run pyshacl \
        -s src/rdf_validation_comparison/data/ex161.shacl \
        src/rdf_validation_comparison/data/ex161.ttl
    hatch run shexeval -A \
        --focus "http://example.com/ns#alice" \
        --start "http://example.com/ns#User" \
        src/rdf_validation_comparison/data/ex161.ttl \
        src/rdf_validation_comparison/data/ex161.shex

pyshex_notebooks_shex_example:
    # run ShEx from code
    # https://github.com/hsolbrig/PyShEx/blob/88b8449939f394545c84741db1668bd8a4d1fdbc/notebooks/shex_example.ipynb
    hatch run python src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.py
    # run ShEx from CLI
    hatch run shexeval -A \
        --focus "http://our.org/example#Obs1" \
        src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.ttl \
        src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.shex
