import pymol
import sys

def main():
    output = sys.argv[1]
    pymol.pymol_argv = ["pymol", "-qc"]
    pymol.finish_launching()
    
    pymol.cmd.fetch("7MIO")
    pymol.cmd.remove("not polymer and not inorganic")

    # 最初は膜の内側から見た様子なので、外側から見るようにする。
    pymol.cmd.rotate("x", 180)
    # 上から見たとき、初期は若干傾いている。これを水平にする。
    pymol.cmd.rotate("z", -10)
    # 上から見たとき、カメラから少し離れている。これを近づける。
    pymol.cmd.move("z", +30)
    # なぜかわからないが、"and not inorganic"をつけないとNa原子が表示されない。
    pymol.preset.pub_solv("7MIO and not inorganic")
    
    pymol.cmd.png(output, width=1000, height=1000, dpi=300, ray=1)

if __name__ == "__main__":
    main()
