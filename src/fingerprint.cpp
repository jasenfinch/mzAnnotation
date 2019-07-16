#include <openbabel/fingerprint.h>
using namespace OpenBabel;

#include <Rcpp.h>
using namespace Rcpp;

std::string fingerprint(std::string smile,std::string type = 'FP2'){
  
  OBFingerprint* fptype = OBFingerprint::FindType(type);
  
}
