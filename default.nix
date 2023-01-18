{ python3, fetchFromGitHub, ... }:

python3.pkgs.buildPythonApplication rec {
  version = "1.0.4-devel";
  pname = "podman-compose";
  src = ./.;
  propagatedBuildInputs = with python3.pkgs; [ pyyaml python-dotenv ];
}
