/**
Base class for all resources.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.resource;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.meta;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.object;
import godot.classdb;
import godot.reference;
import godot.node;
/**
Base class for all resources.

Resource is the base class for all resource types. Resources are primarily data containers. They are reference counted and freed when no longer in use. They are also loaded only once from disk, and further attempts to load the resource will return the same reference (all this in contrast to a $(D Node), which is not reference counted and can be instanced from disk as many times as desired). Resources can be saved externally on disk or bundled into another object, such as a $(D Node) or another resource.
*/
@GodotBaseClass struct Resource
{
	enum string _GODOT_internal_name = "Resource";
public:
@nogc nothrow:
	union { godot_object _godot_object; Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct _classBinding
	{
		__gshared:
		@GodotName("_setup_local_to_scene") GodotMethod!(void) _setupLocalToScene;
		@GodotName("set_path") GodotMethod!(void, String) setPath;
		@GodotName("take_over_path") GodotMethod!(void, String) takeOverPath;
		@GodotName("get_path") GodotMethod!(String) getPath;
		@GodotName("set_name") GodotMethod!(void, String) setName;
		@GodotName("get_name") GodotMethod!(String) getName;
		@GodotName("get_rid") GodotMethod!(RID) getRid;
		@GodotName("set_local_to_scene") GodotMethod!(void, bool) setLocalToScene;
		@GodotName("is_local_to_scene") GodotMethod!(bool) isLocalToScene;
		@GodotName("get_local_scene") GodotMethod!(Node) getLocalScene;
		@GodotName("setup_local_to_scene") GodotMethod!(void) setupLocalToScene;
		@GodotName("duplicate") GodotMethod!(Resource, bool) duplicate;
	}
	bool opEquals(in Resource other) const { return _godot_object.ptr is other._godot_object.ptr; }
	Resource opAssign(T : typeof(null))(T n) { _godot_object.ptr = null; }
	bool opEquals(typeof(null) n) const { return _godot_object.ptr is null; }
	mixin baseCasts;
	static Resource _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("Resource");
		if(constructor is null) return typeof(this).init;
		return cast(Resource)(constructor());
	}
	@disable new(size_t s);
	/**
	
	*/
	void _setupLocalToScene()
	{
		Array _GODOT_args = Array.empty_array;
		String _GODOT_method_name = String("_setup_local_to_scene");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void setPath(in String path)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setPath, _godot_object, path);
	}
	/**
	Set the path of the resource. Differs from set_path(), if another `Resource` exists with "path" it over-takes it, instead of failing.
	*/
	void takeOverPath(in String path)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.takeOverPath, _godot_object, path);
	}
	/**
	
	*/
	String getPath() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(_classBinding.getPath, _godot_object);
	}
	/**
	
	*/
	void setName(in String name)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setName, _godot_object, name);
	}
	/**
	
	*/
	String getName() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(_classBinding.getName, _godot_object);
	}
	/**
	Return the RID of the resource (or an empty RID). Many resources (such as $(D Texture), $(D Mesh), etc) are high level abstractions of resources stored in a server, so this function will return the original RID.
	*/
	RID getRid() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(RID)(_classBinding.getRid, _godot_object);
	}
	/**
	
	*/
	void setLocalToScene(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setLocalToScene, _godot_object, enable);
	}
	/**
	
	*/
	bool isLocalToScene() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.isLocalToScene, _godot_object);
	}
	/**
	
	*/
	Node getLocalScene() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Node)(_classBinding.getLocalScene, _godot_object);
	}
	/**
	
	*/
	void setupLocalToScene()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setupLocalToScene, _godot_object);
	}
	/**
	
	*/
	Ref!Resource duplicate(in bool subresources = false) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Resource)(_classBinding.duplicate, _godot_object, subresources);
	}
	/**
	
	*/
	@property bool resourceLocalToScene()
	{
		return isLocalToScene();
	}
	/// ditto
	@property void resourceLocalToScene(bool v)
	{
		setLocalToScene(v);
	}
	/**
	
	*/
	@property String resourcePath()
	{
		return getPath();
	}
	/// ditto
	@property void resourcePath(String v)
	{
		setPath(v);
	}
	/**
	
	*/
	@property String resourceName()
	{
		return getName();
	}
	/// ditto
	@property void resourceName(String v)
	{
		setName(v);
	}
}
