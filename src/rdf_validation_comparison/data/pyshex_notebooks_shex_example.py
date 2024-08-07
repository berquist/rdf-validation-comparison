from pyshex.evaluate import evaluate
from rdflib import Graph, Namespace
from rdflib.namespaces import XSD

EX = Namespace("http://our.org/example#")
FHIR = Namespace("http://hl7.org/fhir/")

shex = f"""PREFIX : <{FHIR}>
PREFIX xsd: <{XSD}>
BASE <{EX}>

start = @:ObservationShape

:ObservationShape {{               # An Observation has:
  :status ["preliminary" "final"]; #   status in this value set
  :subject @:PatientShape         #   a subject matching <PatientShape>.
}}

:PatientShape {{                  # A Patient has:
 :name xsd:string*;                #   one or more names
 :birthdate xsd:date?              #   and an optional birthdate.
}}
"""

ttl = f"""PREFIX : <{FHIR}>
PREFIX xsd: <{XSD}>
PREFIX ex: <{EX}>

ex:Obs1
  :status    "final" ;
  :subject   ex:Patient2 .

ex:Patient2
  :name "Bob" ;
  :birthdate "1999-12-31"^^xsd:date ."""

g = Graph()
g.parse(data=ttl, format="turtle")

rslt, reason = evaluate(g, shex, EX.Obs1)
if rslt:
    print("CONFORMS")
else:
    print(f"{reason if reason else 'DOES NOT CONFORM'}")
