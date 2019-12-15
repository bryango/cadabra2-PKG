all:
	pythonpath-revert
	makepkg --syncdeps --cleanbuild
