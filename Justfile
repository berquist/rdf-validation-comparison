# Example 161 from https://book.validatingrdf.com/bookHtml013.html
ex161:
    hatch run pyshacl \
        -s src/rdf_validation_comparison/data/ex161.shacl \
        src/rdf_validation_comparison/data/ex161.ttl
    # TODO check that -A is not used here
    hatch run shexeval -A \
        --focus "http://example.com/ns#alice" \
        --start "http://example.com/ns#User" \
        src/rdf_validation_comparison/data/ex161.ttl \
        src/rdf_validation_comparison/data/ex161.shex

# Example 162 from https://book.validatingrdf.com/bookHtml013.html
ex162:
    -hatch run pyshacl \
        -s src/rdf_validation_comparison/data/ex162.shacl \
        src/rdf_validation_comparison/data/ex162.ttl
    -hatch run shexeval -A \
        --start "http://example.com/ns#Product" \
        src/rdf_validation_comparison/data/ex162.ttl \
        src/rdf_validation_comparison/data/ex162.shex

# Show the effect of RDFS inference on SHACL
ch7_6-rdfs-inference:
    -hatch run pyshacl \
        --inference=none \
        -s src/rdf_validation_comparison/data/ch7_6.shacl \
        src/rdf_validation_comparison/data/ch7_6.ttl
    -hatch run pyshacl \
        --inference=rdfs \
        -s src/rdf_validation_comparison/data/ch7_6.shacl \
        src/rdf_validation_comparison/data/ch7_6.ttl

# Basic example from PyShEx on running both from code and the CLI
pyshex_notebooks_shex_example:
    # run ShEx from code
    # https://github.com/hsolbrig/PyShEx/blob/88b8449939f394545c84741db1668bd8a4d1fdbc/notebooks/shex_example.ipynb
    hatch run python src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.py
    # run ShEx from CLI
    # TODO check that -A is not used here
    hatch run shexeval -A \
        --focus "http://our.org/example#Obs1" \
        src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.ttl \
        src/rdf_validation_comparison/data/pyshex_notebooks_shex_example.shex
